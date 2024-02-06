<%@page import="kr.basic.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   int check = MemberDAO.getInstance().checkLogin(id, pw);
   int num =100;
   out.println("<h1>" +num +"</h1>");
   if(check!=0){
	   session.setAttribute("log", check);
   %>
   <script>
alert('로그인성공')
location.href="01_memberlist.jsp";
</script>
   
   <%}else{ %>
      <script>
alert('로그인실패')
location.href="02_memberLogin.jsp";
</script>
   
   <%} %>