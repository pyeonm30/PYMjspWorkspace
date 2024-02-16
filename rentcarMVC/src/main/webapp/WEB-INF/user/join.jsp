<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<script type="text/javascript" src="script/join.js" defer></script>
<div class="content">
	<h1 class="py-3">회원 가입</h1>
	<form action="${ctx}/join.do" method="post" >
		<table class="table">
		   <tr><td colspan="2"> <span id="msg" data-val="${ctx}"></span> </td></tr>
			<tr>
				<td>아이디</td>
				<td class="left"><input class="col-5 left" type="text" name="userid" id="id" autofocus required />
				 <input type="button" value="중복체크" onclick="idcheck()" class="btn btn-outline-dark"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td class="left"><input class="col-12" type="password" name="pwd" id="pw" required/>
				</td>
				
			</tr>
			<tr>
				<td>이름</td>
				<td class="left"><input class="col" type="text" name="name" id="name" required/></td>
			</tr> 
			<tr>
			<tr>
				<td>이메일</td>
				<td class="left"><input class="col" type="text" name="email" id="email" required/></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td class="left"><input class="col" type="tel" name="phone" id="phone" required/></td>
			</tr>
			<tr>
				<td colspan="2" id="btns">
					<input type="button" value="가입" class="col-3 btn btn-primary" onclick="validCheck(form)" /> 
					<input type="reset" value="취소" class="col-3 btn btn-warning" /></td>
			</tr>
	
		</table>
	</form>
</div>

<%@ include file="../parts/footer.jsp"%>