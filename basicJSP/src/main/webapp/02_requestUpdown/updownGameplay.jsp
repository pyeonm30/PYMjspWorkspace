<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    Random rd = new Random();
     String com = request.getParameter("com");
     int rNum = 0;
     if(com =="" || com == null){
      rNum = rd.nextInt(100)+1;
     }else{
    	 rNum = Integer.parseInt(request.getParameter("com"));
     }
     
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p> 치트키 <%= rNum %></p>
<form action="updownGameplayPro.jsp">
 <input type="number" name="me" required min="1" max="100"/>
 <input type="hidden" name="com" value=<%= rNum %> />
 <button> 전송 </button>
</form>


</body>
</html>