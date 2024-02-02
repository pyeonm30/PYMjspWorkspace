<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//int cnt=MemberDAO.getInstance().memberDelete(request.getParameter("id"));
int cnt =0;	
if(cnt>0) {
		response.sendRedirect("01_memberlist.jsp");
	}else {
		throw new ServletException("not delete");	
	}
%>    