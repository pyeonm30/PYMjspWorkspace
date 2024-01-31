<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
  if(session.getAttribute("log")== null){
	  response.sendRedirect("index.jsp");
  }
 int log = (int)session.getAttribute("log");
 ArrayList<String> nameList = (ArrayList<String>)session.getAttribute("namelist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 홈화면(메인페이지) </h1>
	<table>
	
	<% if(log == -1){ %>
		<tr>
        	<td><a href="03_11joinForm.jsp"> 회원가입 </a></td>
       		 <td><a href="03_21loginForm.jsp"> 로그인 </a></td>
		</tr>
	<%}else { %>
    <tr>
        <td colspan="3"><h1> <%=nameList.get(log) %>님 환영합니다</h1></td>
    </tr>
    <tr>    
    	<td><a href="03_23logoutPro.jsp"> 로그아웃 </a></td>
        <td><a href="03_31updateForm.jsp"> 회원정보수정 </a></td>
	    <td><a href="03_41deleteForm.jsp"> 회원탈퇴 </a></td>
	   </tr>
	<%} %>
</table>
</body>
</html>