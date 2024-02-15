<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연미 렌트카</title>
<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css">
<script type="text/javascript" src="script/main.js" defer></script>
<body onload="init('${userId}')">

  <div class="container">
    <header>
      <div class="banner">
          <div class="lnb all-user">
          <a class="login-open"> 로그인 </a>
          <a href="#"> 회원가입 </a>
        </div>
        <div class="lnb login-user">
         <a href="${ctx}/userInfo.do"> [${userId} ]님 </a>
         <a class="logout-btn"> 로그아웃</a>
        </div>
      </div>
      <nav>
        <div class="logo">
          <a href="#"><img src="img/logo.jpg" alt="logo"></a>
        </div>
        <div class="gnb">
          <a href="${ctx}/carList.do?kind=recent">차량 조회</a>
          <a href="${ctx}/userReserveList.do"> 내 예약 확인  </a>
          <a href="${ctx}/registerCar.do"> 차량 등록</a>
        </div>
      </nav>
      <div class="trigger">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </header>

