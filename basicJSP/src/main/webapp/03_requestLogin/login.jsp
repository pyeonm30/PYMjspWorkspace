<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String name = request.getParameter("name");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> <%=name %></h1>
<h1> <%=id %></h1>
<h1> <%=pw %></h1>

<h1> 로그인 </h1>
<form method="post" action="loginPro.jsp">
 ID : <input type="text" name="inputId" /> <br><br>
 PW : <input type="text" name="inputPw" /> <br><br>
 <input type="hidden" name="name" value="<%=name %>"/>
 <input type="hidden" name="id" value="<%=id %>"/>
 <input type="hidden" name="pw" value="<%=pw %>"/>
 
<input type="submit" value="LOG-IN" />
</form>
<br>
<button onclick="location.href='index.jsp'"> 홈으로 </button>

</body>
</html>