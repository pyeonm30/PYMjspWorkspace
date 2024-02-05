<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String name= "";
ArrayList user = new ArrayList();

if(session.getAttribute("name")!= null && session.getAttribute("user")!= null){
  name = (String)session.getAttribute("name");
  user = (ArrayList)session.getAttribute("user");
  %>

  <h1> <%=name %></h1>
  <h1> <%=user.get(0) %></h1>
  <h1> <%=user.get(1) %></h1>
  
<% } %>


<h1> 로그인 </h1>
<form method="post" action="loginPro.jsp">
 ID : <input type="text" name="inputId" /> <br><br>
 PW : <input type="text" name="inputPw" /> <br><br>
<input type="submit" value="LOG-IN" />
</form>
<br>
<button onclick="location.href='index.jsp'"> 홈으로 </button>

</body>
</html>