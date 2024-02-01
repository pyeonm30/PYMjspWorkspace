<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 	<%
    if(session.getAttribute("dao") == null){
      	 response.sendRedirect("index.jsp");
      	 return;
      }
    BoardDAO dao = (BoardDAO)session.getAttribute("dao");
    String writer = request.getParameter("writer");
    String subject = request.getParameter("subject");
    String contents = request.getParameter("contents");
    
    dao.addOneBoard(writer, subject, contents);
 	
%>
<script>
alert('게시글 한개 추가 완료');
location.href='_01_boardList.jsp';
</script>