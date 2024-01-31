<%@page import="gugudon.GugudanDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
if(session.getAttribute("dao")== null){
	response.sendRedirect("index.jsp");
	return;
}
GugudanDAO dao = (GugudanDAO)session.getAttribute("dao");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1> 구구단 게임 </h1>
 
<% if(dao.getCount() < 5){ %>
 <h2> <%= dao.getCount()+1 %> 번째 문제 (현재 점수 : <%= dao.getScore() %>) </h2>
 
 <form action="gugudanPro.jsp">
 <h2> <%= dao.getQuiz() %> = 
 <input type="number" name="answer" required />
 </h2>
 <button> 전송 </button>
 </form>
 
 <%}else{ %>
 <h1> 게임 종료! 당신의 총점수 <%= dao.getScore() %></h1>
 <a href="index.jsp"> 처음으로 </a>
 <% } %>
</body>
</html>