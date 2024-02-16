<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>


<div class="content">
	<h1 class="py-3">${vo.name}회원의상세보기</h1>
	<p class="m-1" id="msg2"></p>
	<input type="hidden" name="num" value="${vo.num}" />
	<table class='table table-bordered'>
		<tr>
			<td><span id="ctx" data-val="${ctx}"></span></td>
			<td><input type="hidden" name="pwd" id="pwd" value="${vo.pwd}" /></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td class="left" id="userid">${vo.userid}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td class="left">${vo.name}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input class="col-12" id="email" type="text" name="email"
				value="${vo.email}" /></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input class="col-12" id="phone" type="text" name="phone"
				value="${vo.phone}" /></td>
		</tr>

		<tr>
			<td align="center"><button id="delBtn" value="회원탈퇴"
					class='btn btn-danger'>회원탈퇴</button></td>
			<td align="center"><input type="button" id="update" value="수정하기"
				class='btn btn-primary' /></td>
		</tr>
	</table>



</div>

<dialog id="myModal">
<h2>회원탈퇴</h2>
<p class="m-2">한번 탈퇴하면 모든 정보가 사라집니다</p>
<p class="m-1" id="msg"></p>
비밀번호<input class="m-3" type=text name="pw" id="inputPw" requried>
<br>
<button value="cancel" id="cancelBtn">취소</button>
<input type="button" id="confirmBtn" value="탈퇴" /> </dialog>

<script>
let ctx = $("#ctx").attr("data-val");
let email = $("#email").val();
let phone = $("#phone").val();
const dialog = document.querySelector("dialog");
const delBtn = document.querySelector("#delBtn");
$("#delBtn").click(
		function() {
			dialog.showModal();
		}
);

$("#cancelBtn").click(
		function() {
			dialog.close();
		}
);

function deleteCheck(){
    	let pwd = $('#pwd').val();
    	let inputPw = $('#inputPw').val();
    
    	if(pwd === inputPw){
    		$("#msg").html("비밀번호가 일치합니다");
    		return true;
    	}else{
    		$("#msg").html("비밀번호가 일치하지않습니다");
    		return false;
    	}
    
}

$("#confirmBtn").click(function() {

	if(deleteCheck()){
		$.ajax({
			type : "post",
			url : ctx+"/deleteUser.do",
			data : {id : $("#userid").val() },
			success : function(data) {
				console.log(data);
				if (data == "null") {
					alert("탈퇴 실패하였습니다");
				} else {
					alert("탈퇴완료 하였습니다");
				}
			  window.location.href = "main.do";
				
			},error: function(request,status,error){
		        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }

		});
	}
}
);

function validCheck(){
	$("#msg2").html("");
	if(!email.match(/[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/)){
		$("#msg2").html("이메일 형식이 다릅니다");
		$("#email").focus();
		return false;
	}
	
	if(!phone.match(/010-\d{3,4}-\d{4}/)){
		$("#msg2").html("전화번호 형식이 다릅니다");
		 $("#phone").focus();
		return false;
	}
	$("#msg2").html("");
	return true;
	
}

$("#update").click(function() {
	if (validCheck()) {
		$.ajax({
			type : "post",
			url : ctx+"/updateUser.do",
			data : {email : $("#email").val(), phone : $("#phone").val() },
			success : function(data) {
				console.log(data);
				if (data == "null") {
					alert("수정이 실패하였습니다");
					window.location.href = "main.do";
				} else {
					alert("정보수정을 완료하였습니다");
					window.location.href =  ctx+"/userInfo.do";
				}
				
			},error: function(request,status,error){
		        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }

		});
	}
});


</script>

<%@ include file="../parts/footer.jsp"%>