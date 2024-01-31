<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    
<%@ include file="./common.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 JSP 로그인 구현 실습 ver2</title>
</head>
<body>
<div class="gnb">

   <a href="main.jsp"> 홈 </a> &nbsp;&nbsp;
   
   <% if(dao.getLog()== -1){ %>
   <a href="joinForm.jsp"> 회원가입 </a> &nbsp;&nbsp;
   <a href="loginForm.jsp"> 로그인 </a> &nbsp;&nbsp;
   <%}else{ %>
   <a href="logoutPro.jsp"> 로그아웃 </a> &nbsp;&nbsp;
   <a href="updateForm.jsp"> 회원정보수정 </a> &nbsp;&nbsp;
   <a href="deleteForm.jsp"> 회원탈퇴 </a> &nbsp;&nbsp;
   <%} %>
   <a href="userList.jsp"> 전체회원보기 </a> &nbsp;&nbsp;
   
</div>

<hr>
<div align="center">

