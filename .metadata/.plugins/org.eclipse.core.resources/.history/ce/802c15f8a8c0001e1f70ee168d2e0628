<%@page import="board.Board"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("dao") == null){
	response.sendRedirect("index.jsp");
	return;
}

BoardDAO dao = (BoardDAO)session.getAttribute("dao");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p> 전체 게시글 수 <%=dao.getTotalData() %></p>
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>제목</th>
			<th>내용</th>
			<th>삭제</th>
		</tr>
		<% for(int i =0; i < dao.getTotalData(); i+=1){ 
			Board b = dao.getOneBoard(i);
			%>
			<tr>
			  <td> <%=b.getNo() %></td>
			  <td> <%=b.getWriter() %></td>
			  <td> <%=b.getRegDate() %></td>
			  <td> <a href="_05_updateBoard.jsp?idx=<%= i %>" > <%=b.getSubject() %> </a> </td>
			  <td> <%=b.getContents() %></td>
			  <td> <button onclick="location.href='_06_deleteBoardPro.jsp?idx=<%= i %>'"> 삭제 </button></td>
			</tr>
		
		<%} %>
	</table>
</body>
</html>