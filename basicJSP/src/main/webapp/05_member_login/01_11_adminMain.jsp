<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
  if(session.getAttribute("log")== null){
	  response.sendRedirect("index.jsp");
	  return;
  }else if(session.getAttribute("admin")== null){
	  response.sendRedirect("02_main.jsp");
	  return;
  }

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="commom.js"></script>   
</head>
<body>
<h1> 관리자 메인 </h1>
	<a href="03_23logoutPro.jsp"> 로그아웃 </a>
	<a href="01_13_adminUserList.jsp"> 회원관리 </a>
<input type="button" value="메인으로" id="btn" onclick="location.href='02_main.jsp'" />
</body>
</html>