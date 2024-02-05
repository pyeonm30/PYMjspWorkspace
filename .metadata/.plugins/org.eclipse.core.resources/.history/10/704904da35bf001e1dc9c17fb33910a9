<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
  String name = request.getParameter("name");
  String id = request.getParameter("id");
  String pw = request.getParameter("pw"); 
  String inputId = request.getParameter("inputId"); 
  String inputPw = request.getParameter("inputPw");
  boolean pass = false;
  String msg ="";
  if(id.equals(inputId) && pw.equals(inputPw)){
	  msg="로그인 성공";
	  pass = true;
  }else{
	  msg="로그인 실패";
  }
    %>
    
 <script>
function printMsg(id, pw , name , url ,msg) {
	alert(msg);
	location.href=url +"?id="+id+"&pw="+pw+"&name="+name;
}

</script>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> <%=name %></h1>
<h1> <%=id %></h1>
<h1> <%=pw %></h1>
<h1> <%=inputId %></h1>
<h1> <%=inputPw %></h1>


<h1><%=msg %></h1>
<% if(pass){ %>

<script>
printMsg("<%=id%>" ,'<%=pw%>','<%=name%>',"index.jsp" ,"로그인성공" );
</script>

<%}else{ %>
<script>
printMsg('<%=id%>' ,"<%=pw%>","<%=name%>","login.jsp" ,"로그인실패" );
</script>
<%} %>
</body>
</html>

