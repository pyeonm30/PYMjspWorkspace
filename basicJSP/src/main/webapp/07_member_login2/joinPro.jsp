<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./common.jsp" %>    

<%
  String id = request.getParameter("id");

if(dao.existsId(id)!= -1){
	%>
	<script>
	goBack("이미 존재하는 id 입니다");
	</script>
	<% 
	
}else{
  String pw = request.getParameter("pw");
  String name = request.getParameter("name");
  String gender = request.getParameter("gender");
  
  dao.addMember(id, pw, name, gender);
 
	%>
	
	<script>
	msgGoMain("회원 가입 완료!");
	</script>

<%} %>
