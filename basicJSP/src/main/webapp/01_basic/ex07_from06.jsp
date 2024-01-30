<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <a href="ex04_form03.jsp"> form03로 이동 </a>
   <button onclick="movePage()"> form03로 이동 </button>
   
   <form action="ex08_from06pro.jsp" method="get">
   	<input type="number" id="num1" name="num1" />
   	   	<input type="number" id="num2" name="num2" />
   	<input type="button" id="btn1" value="전송1"/>
   	<input type="submit" value="버튼1"/>
   	<button> 버튼2</button> <!-- form 태그 안에 있는 버튼은 <input type="submit"/> 와 동일 -->
   </form>
    <button onclick="goNextPage()"> 전송2</button> <!-- 	form 태그 밖에 있는 버튼은 <input type="button"/> 과 동일-->

   <a href="ex08_from06pro.jsp?num1=<%=10%>&num2=<%=20 %>"> form06pro로 이동 </a>
</body>
</html>
<script>
document.querySelector("#btn1").addEventListener("click",goNextPage);

function movePage(){
	location.href="ex04_form03.jsp";
}
function goNextPage(){
	let name1 = document.querySelector("#num1").name;
	let name2 = document.querySelector("#num2").name;
	let value1 = document.querySelector("#num1").value;
	let value2 = document.querySelector("#num2").value;
	let url = `ex08_from06pro.jsp?${name1}=${value1}&${name2}=${value2}`;
	goUrl(url);
}

function goUrl(url){
	location.href = url;
}
  
</script>