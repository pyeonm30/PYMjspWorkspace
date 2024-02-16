<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<c:set var="ctx" value="${pageContext.request.contextPath}" />
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>연미 렌트카</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
			<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css">
			<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>

		<body>
			<header class="container banner">
				<div class="row">
					<div class="col-md-auto"><img src="img/rent_logo.jpg" alt="logoImg" id="logo"
							onclick="location.href='${ctx}/main.do'"></div>
					<div class="col banner">
						<c:if test="${id ne null}">
							${id}님
							<button class="btn btn-primary px-3 mx-3" onclick="location.href='${ctx}/loginOut.do'"> 로그아웃 </button>
						</c:if>

						<c:if test="${id eq null}">
							<button class="btn btn-primary px-3 mx-3 " onclick="location.href='${ctx}/main.do?center=user/login'"> 로그인
							</button>
							<button class="btn btn-primary px-3 mx-3" onclick="location.href='${ctx}/main.do?center=user/join'"> 회원가입
							</button>
						</c:if>
					</div>

					<div class="w-100"></div>
					<c:if test="${id ne null}">
						<c:if test="${admin eq null}">
							<div class="col menu_item"> <a href="${ctx}/carList.do?kind=recent">예 약 하 기</a> </div>
							<div class="col menu_item"> <a href="${ctx}/userReserveList.do">예 약 확 인</a> </div>
							<div class="col menu_item"> <a href="${ctx}/main.do">문의 게시판 </a> </div>
							<div class="col menu_item"> <a href="${ctx}/userInfo.do"> 내 정보 확인 </a> </div>
						</c:if>

						<c:if test="${admin ne null}">
							<div class="col menu_item"> <a href="${ctx}/main.do">신규 차량 등록</a> </div>
							<div class="col menu_item"> <a href="${ctx}/main.do"> 전체 예약 확인</a> </div>
							<div class="col menu_item"> <a href="${ctx}/main.do">문의 게시판 관리</a> </div>
							<div class="col menu_item"> <a href="${ctx}/main.do"> 고객 정보 확인 </a> </div>
						</c:if>
					</c:if>
				</div>
			</header>

			<section>