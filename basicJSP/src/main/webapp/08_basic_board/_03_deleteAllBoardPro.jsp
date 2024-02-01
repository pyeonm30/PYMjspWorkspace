<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("dao") == null){
	response.sendRedirect("index.jsp");
	return;
}
BoardDAO dao = (BoardDAO)session.getAttribute("dao");

dao.deleteAllData();
%>
<script>
alert('전체 데이터 삭제 완료');
location.href='_01_boardList.jsp';
</script>