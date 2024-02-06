package kr.basic.frontcontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.basic.controller.Controller;

// ~ .do로 끝나는 모든 서블릿이 작동하는 프론트 컨트롤러 

@WebServlet("*.do")
public class MemberFrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String url=request.getRequestURI();	
		System.out.println("url:" + url );
		String ctx=request.getContextPath();
		System.out.println("ctx:" + ctx );
		// 실제로 요청한 명령이 무엇이지 파악
		String command=url.substring(ctx.length());
		System.out.println("command:" + command); // /memberInsert.do
		Controller controller=null;
		String nextPage=null;
		// 핸들러매핑->HandlerMapping : 우리가 가지고 있는 url들 맵핑한 클래스 
	    HandlerMapping mapping=new HandlerMapping();
	    
	    controller=mapping.getController(command); // new~ Controller() : 주소값 받아서 
	    nextPage=controller.requestHandler(request, response);
		// forward, redirect
	    
		if(nextPage!=null) {
			if(nextPage.indexOf("redirect:")!=-1) {
				//            redirect:/MemberMVC3/memberList.do
				response.sendRedirect(nextPage.split(":")[1]); // redirect
			}else {
				RequestDispatcher rd=request.getRequestDispatcher(ViewResolver.makeView(nextPage)); // forward
				rd.forward(request, response);
			}
		}		
	}
}
