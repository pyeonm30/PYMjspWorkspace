<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./common.jsp" %>    
<%

  String id = request.getParameter("id");
  String pw = request.getParameter("pw");
  
  boolean pass = dao.checkLogin(id, pw);

  if(pass){
	  if(id.equals("admin")){
			session.setAttribute("admin", "admin");
	    %> 
			<script>
			msgUrl("관리자님 환영합니다" ,"main.jsp" );	
			</script> 
		<%	
	  }else{
	  	%>
	<script>
	msgGoMain("로그인성공");
	</script>
	<%
	  }
  }else{
		%>
		<script>
		msgUrl("로그인실패" ,"loginForm.jsp" );
		</script>
		<%
	  
  }

%>
