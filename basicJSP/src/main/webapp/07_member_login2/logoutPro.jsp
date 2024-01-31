<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./common.jsp" %>    

<%

if(dao.getLog() == -1){
	   response.sendRedirect("loginForm.jsp");
	   return;
}
   dao.setLog(-1);
   if(session.getAttribute("admin") != null){
   	  session.removeAttribute("admin");
   }
%>
<script>
msgGoMain("로그아웃 완료");
</script>
