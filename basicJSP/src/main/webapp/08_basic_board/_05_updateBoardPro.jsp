<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
if(session.getAttribute("dao") == null){
	response.sendRedirect("index.jsp");
	return;
}

BoardDAO dao = (BoardDAO)session.getAttribute("dao");

String idx = request.getParameter("index");
String subject = request.getParameter("subject");
String contents = request.getParameter("contents");

dao.updateOneBoard(idx, subject, contents);
%>
<script>
alert('게시글 수정 완료');
location.href='_01_boardList.jsp';
</script>