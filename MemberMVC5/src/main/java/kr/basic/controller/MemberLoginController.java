package kr.basic.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.basic.model.MemberDAO;

public class MemberLoginController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
	      if(request.getParameter("id") == null) {
	        	return "memberLogin";
	        }
		String pw = request.getParameter("pw");
		
		String ctx=request.getContextPath();

		if (MemberDAO.getInstance().getInstance().checkLogin(id, pw)) {
			return "redirect:"+ctx+"/memberLogin.do";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("log", MemberDAO.getInstance().getMemberNo(id));
			return "redirect:"+ctx+"/memberList.do";
		}
		
	}
}
