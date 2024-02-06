package kr.basic.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.basic.model.MemberDAO;
import kr.basic.model.MemberVO;


@WebServlet("/memberList.do")
public class MemberListController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			                                  throws ServletException, IOException {

		ArrayList<MemberVO> list=MemberDAO.getInstance().memberList();		
		request.setAttribute("list", list);
		RequestDispatcher rd=request.getRequestDispatcher("member/memberlist.jsp");
		rd.forward(request, response); //-----------------------------------▲
		
	}
}
