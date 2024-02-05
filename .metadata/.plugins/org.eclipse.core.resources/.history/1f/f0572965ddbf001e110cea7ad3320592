<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="commom.js"></script>
<%
int idx = (int)session.getAttribute("log");

String pw = request.getParameter("pw");
String name = request.getParameter("name");
String gender = request.getParameter("gender");


ArrayList<String> pwlist = (ArrayList<String>)session.getAttribute("pwList");
ArrayList<String> namelist = (ArrayList<String>)session.getAttribute("namelist");
ArrayList<String> genderlist = (ArrayList<String>)session.getAttribute("genderList");

if(pw.equals(pwlist.get(idx))){

namelist.set(idx , name);
genderlist.set(idx,gender);
session.setAttribute("namelist", namelist);
session.setAttribute("genderList", genderlist);

%>
<script>


msgGoMain("회원 정보 수정완료");

</script>

<%

}else{
	
	%>
	<script>
	msgUrl("비밀번호를 다시입력해주세요" ,"03_31updateForm.jsp" );

	</script>

	<%
}


%>