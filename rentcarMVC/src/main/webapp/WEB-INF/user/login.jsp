<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<script type="text/javascript" src="script/login.js" defer></script>

	<div >
		<div id="title" class="mt-3 mb-3"></div>
		<div class="form-floating mb-3">
			<input type="text" class="form-control" id="id" placeholder="ID" required>
			 <label for="floatingInput">ID</label>
		</div>
		<div class="form-floating mb-3">
			<input type="password" class="form-control" id="pw" placeholder="Password" required> 
			<label for="floatingPassword">Password</label>
		</div>
		<div>
			<button id="login" class="btn btn-primary mx-3">로그인</button>
		
			<button id="cancle" class="btn btn-primary">취소</button>
		</div>

	</div>




<%@ include file="../parts/footer.jsp"%>