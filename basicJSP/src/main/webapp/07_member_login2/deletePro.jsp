<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./common.jsp" %>    

<%
String pw = request.getParameter("pw");

if(dao.deleteLogMember(pw)){
	%>
	<script>
	msgGoMain("회원 탈퇴 완료 ");
	</script>
	<%	
}else{
	%>
	<script>
	msgUrl("비밀번호를 다시입력해주세요" ,"deleteForm.jsp" );
	</script>
	<%
	
}
%>