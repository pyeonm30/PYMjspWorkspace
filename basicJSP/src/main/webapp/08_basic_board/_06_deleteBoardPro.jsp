<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
if(session.getAttribute("dao") == null){
	response.sendRedirect("index.jsp");
	return;
}

BoardDAO dao = (BoardDAO)session.getAttribute("dao");

if(request.getParameter("idx") == null){
	response.sendRedirect("_01_boardList.jsp");
	return;
}
String idx = request.getParameter("idx");
boolean check = dao.deleteOneBoard(idx);

if(check){
	%>
	<script>
	alert('게시글 삭제 완료');
	location.href='_01_boardList.jsp';
	</script>
	<%
}else{
	%>
	<script>
	alert('게시글 삭제 실패');
	location.href='_01_boardList.jsp';
	</script>
	<%
}

%>