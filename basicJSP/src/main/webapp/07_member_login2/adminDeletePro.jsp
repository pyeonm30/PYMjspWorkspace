<%@page import="member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./common.jsp" %>    
<% 
if(request.getParameter("idx") == null || 
	session.getAttribute("admin") == null
		){
	%>
	<script>
	msgError();
      
   </script>
	<%
}else{

	int idx = Integer.parseInt(request.getParameter("idx"));
	Member m = dao.deleteAMember(idx);
	if(m!=null){
		%>
		<script>
		msgUrl( "<%=m.getName() %> 회원 삭제 완료" ,"userList.jsp" );
	   </script>
		<%
	}else{
		%>
		<script>
		 goBack("회원 삭제 실패 ");
	   </script>
		<%
		
	}
}

%>
