<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" src="commom.js"></script>

<% 
  if(session.getAttribute("log")== null){
	  response.sendRedirect("index.jsp");
  }

String id = request.getParameter("id");
String pw = request.getParameter("pw");

ArrayList<String> idList = (ArrayList<String>)session.getAttribute("idList");
ArrayList<String> pwList = (ArrayList<String>)session.getAttribute("pwList");
boolean pass = false;
int idx = -1;
for(int i =0; i < idList.size(); i+=1){
	if(idList.get(i).equals(id)){
		idx = i;
		break;
	}
}
if(idx != -1&& pw.equals(pwList.get(idx))){
	pass = true;
}

if(!pass){
	%>
	<script>
	
	msgUrl("로그인실패" ,"03_21loginForm.jsp" );
	
	</script>
	
	<%
}
session.setAttribute("log", idx);
if(id.equals("admin")){
	
	session.setAttribute("admin", "admin");
	
	%>
	<script>
	
	msgUrl("관리자님 환영합니다" ,"01_11_adminMain.jsp" );
	
	</script>
	
	<%
}else{
	%>
	<script>
	
	msgGoMain("로그인성공");
	
	</script>
	
	<%
	}



%>

