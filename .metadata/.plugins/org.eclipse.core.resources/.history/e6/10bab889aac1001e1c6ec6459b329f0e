<%@page import="kr.basic.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   boolean check = MemberDAO.getInstance().checkLogin(id, pw);
   
   if(check){
	   session.setAttribute("log", id);
   %>
   <script>
alert('로그인성공')
location.href="01_memberlist.jsp";
</script>
   
   <%} %>