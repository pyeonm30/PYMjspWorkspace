<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax, json 연습</title>
</head>
<body>
<form>
	<input type="hidden" id="ctx" value="${ctx}">
	<input type="button" id="strBtn" value="문자열데이터 가져오기">
	<input type="button" id="arrayBtn" value="배열열데이터 가져오기">
	<input type="button" id="objBtn" value="객체데이터 가져오기">
	<input type="button" id="listBtn" value="리스트데이터 가져오기">
	<input type="button" id="mapBtn" value="Map데이터 가져오기">
</form>
<h3>응답 데이터 출력하기</h3>
<div id="result"></div>
</body>
</html>

<script type="text/javascript">


  // String processing - response when strBtn is clicked
  document.getElementById("strBtn").addEventListener("click", function () {
    fetch("jsonDataTest.do", {
      method: "POST",
      body: "choice=string",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    })
    .then(response => response.json())
    .then(data => {
      document.getElementById("result").innerHTML = data;
    })
    .catch(error => console.error('Error:', error));
  });

  // Array processing - response when arrayBtn is clicked
  document.getElementById("arrayBtn").addEventListener("click", function () {
    fetch("jsonDataTest.do", {
      method: "POST",
      body: "choice=array",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    })
    .then(response => response.json())
    .then(data => {
      let htmlCode = "";
      data.forEach(function (value, index) {
        htmlCode += index + "th data: " + value + "<br>";
      });
      document.getElementById("result").innerHTML = htmlCode;
    })
    .catch(error => console.error('Error:', error));
  });

  // Object data processing - response when objBtn is clicked
  document.getElementById("objBtn").addEventListener("click", function () {
    fetch("jsonDataTest.do", {
      method: "POST",
      body: "choice=object",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    })
    .then(response => response.json())
    .then(data => {
      let htmlCode = "Member ID: " + data.id + "<br>";
      htmlCode += "Member Name: " + data.passwd + "<br>";
      htmlCode += "Password: " + data.name + "<br>";
      htmlCode += "Registration date: " + data.reg_date + "<br>";
      htmlCode += "Member address: " + data.address + "<br>";
      htmlCode += "Membership number: " + data.tel + "<br>";
      document.getElementById("result").innerHTML = htmlCode;
    })
    .catch(error => console.error('Error:', error));
  });

  // List data processing - response when listBtn is clicked
  document.getElementById("listBtn").addEventListener("click", function () {
    fetch("jsonDataTest.do", {
      method: "POST",
      body: "choice=list",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    })
    .then(response => response.json())
    .then(data => {
      let htmlCode = "";
      data.forEach(function (member, index) {
        htmlCode += (index + 1) + "th data <br>";
        htmlCode += "Member ID: " + member.id + "<br>";
        htmlCode += "Member Name: " + member.passwd + "<br>";
        htmlCode += "Password: " + member.name + "<br>";
        htmlCode += "Registration date: " + member.reg_date + "<br>";
        htmlCode += "Member address: " + member.address + "<br>";
        htmlCode += "Membership number: " + member.tel + "<br>";
        htmlCode += "<hr color='blue'>";
      });
      document.getElementById("result").innerHTML = htmlCode;
    })
    .catch(error => console.error('Error:', error));
  });

  // Map data processing - response when mapBtn is clicked
  document.getElementById("mapBtn").addEventListener("click", function () {
    fetch("jsonDataTest.do", {
      method: "POST",
      body: "choice=map",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    })
    .then(response => response.json())
    .then(data => {
      let htmlCode = "name " + data.name + "<br>";
      htmlCode += "age: " + data.age + "<br>";
      htmlCode += "tel: " + data.tel + "<br>";
      htmlCode += "addr: " + data.addr + "<br>";
      document.getElementById("result").innerHTML = htmlCode;
    })
    .catch(error => console.error('Error:', error));
  });


</script>