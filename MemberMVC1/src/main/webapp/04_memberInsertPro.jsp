<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	 String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String name=request.getParameter("name");
	int age=Integer.parseInt(request.getParameter("age")); 
	String email=request.getParameter("email");
	String phone=request.getParameter("phone");

%>