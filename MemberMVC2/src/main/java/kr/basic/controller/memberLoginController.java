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

@WebServlet("/memberLogin.do")
public class memberLoginController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		String dbPw = MemberDAO.getInstance().checkMemberId(id);
		response.setContentType("text/html; charset=UTF-8");
		String ctx=request.getContextPath();
		PrintWriter writer = response.getWriter(); // jsp => out ��ü 
		if (dbPw == null || dbPw.equals(pw) == false) {
			writer.println("<script>alert('�α��� ���� '); location.href='member/memberLogin.jsp;</script>");
		} else {
			HttpSession session = request.getSession(); // jsp -> session��ü �ҷ����� 
			session.setAttribute("log", MemberDAO.getInstance().getMemberNo(id));
			writer.println("<script>alert('" + id + "�� �α��� ���� '); location.href='"+ctx+"/memberList.do';</script>");
		}
		
		writer.close();

	}

}