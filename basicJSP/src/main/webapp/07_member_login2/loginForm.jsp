<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>    

<h1> 로그인 </h1>
<form action="loginPro.jsp">
<table border="1">
		<tr><td> ID </td><td><input type="text" name="id"></td></tr>
		<tr><td> PW </td><td><input type="text" name="pw"></td></tr>
		<tr><td colspan = "2" align="center" id="submit"><input type="submit" value="로그인"></td></tr>
	</table>
	
</form>

<%@ include file="./footer.jsp" %>    