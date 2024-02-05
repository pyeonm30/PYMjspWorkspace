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
    int idx =0;
    try{
    	idx = Integer.parseInt(request.getParameter("idx"));
    	if(idx < 0 || idx >= dao.getTotalData()){
    		throw new Exception();
    	}
    }catch(Exception e){
    	 response.sendRedirect("_01_boardList.jsp");
      	 return;
    }
    
    
    
    
    Board b = null;
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글 수정하기</h1>
	<form method="post" action="_05_updateBoardPro.jsp">
		<table border="1">
			<tr>
				<th>번호</th>
				<td colspan="3"><%= b.getNo() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%= b.getWriter() %></td>
				<th>작성일</th>
				<td><%= b.getRegDate()%></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">
					<input type="text" name="subject" value="<%= b.getContents() %>">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
					<textarea rows="10" cols="20" name="contents"><%= b.getContents() %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="hidden" name="index" value="<%= b.getNo() %>">
					<input type="submit" value="수정하기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>