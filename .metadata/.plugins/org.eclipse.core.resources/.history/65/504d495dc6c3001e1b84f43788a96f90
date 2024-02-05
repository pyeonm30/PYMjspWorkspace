<%@page import="kr.basic.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
int num=Integer.parseInt(request.getParameter("num"));
int age=Integer.parseInt(request.getParameter("age"));
String email=request.getParameter("email");
String phone=request.getParameter("phone");

int cnt = MemberDAO.getInstance().updateOneMember(num, age, email, phone);

if(cnt > 0){
%>
		   <script>
alert('회원 수정 성공 ')
location.href="01_memberlist.jsp";
</script>
<%}%>