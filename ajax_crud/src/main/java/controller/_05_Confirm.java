package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
@SuppressWarnings("serial")
@WebServlet("/confirm.do")
public class _05_Confirm extends HttpServlet {
       
// ajax 
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		
		MemberDAO manager = MemberDAO.getInstance();
		int check= manager.confirmId(id); // 1 id 이미 존재함 0 아이디 존재하지않음 
		System.out.println("check=" + check);
		
		// out 객체 --> ajax 값을 String(contectType ="text/html")
		response.getWriter().print(check);   //"0","1"
		
	}
	
}
