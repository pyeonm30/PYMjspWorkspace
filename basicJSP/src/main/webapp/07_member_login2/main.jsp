<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>    

<%
System.out.println("main.jsp");
%>

 <h1> 메인 : 로그인 상태  <br> <%= dao.getLog()== -1 ? "로그아웃" : dao.getLogMember().getName() %> </h1>

<%@ include file="./footer.jsp" %>    