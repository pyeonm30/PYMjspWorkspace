<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
  if(session.getAttribute("log")== null){
	  response.sendRedirect("index.jsp");
  }

session.setAttribute("log", -1);
response.sendRedirect("02_main.jsp");

%>
