<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 로그인 </h1>
<form method="post" action="loginPro.jsp">
 ID : <input type="text" name="id" /> <br><br>
 PW : <input type="text" name="pw" /> <br><br>
<input type="submit" value="LOG-IN" />
</form>
<br>
<button onclick="location.href='index.jsp'"> 홈으로 </button>
</body>
</html>