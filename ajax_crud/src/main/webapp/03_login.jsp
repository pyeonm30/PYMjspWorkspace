<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<div align="center">
		<h1>로그인</h1>

		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" id="id" name="id" required
					placeholder="아이디입력"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" id="passwd" name="passwd" required
					placeholder="6~16자 숫자/문자"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button id="login">로그인</button>
					<button id="join">회원가입</button>
					<button id="cancle">취소</button>
				</td>
			</tr>
		</table>
	
	</div>
</body>
</html>

<script>

	$("#login").click(function() {
			let query = {
				id : $("#id").val(),
				passwd : $("#passwd").val()
			};

			$.ajax({
				type : "POST",
				url : "loginPro.do",
				data : query,
				success : function(data) {

					if(data == 1){
						alert("로그인성공");
						window.location.href = "main.do";
					}else {
						alert("아이디와 패스워드를 확인해주세요.");
						$("#id").val("");
						$("#passwd").val("");
					}	
				
				}
				
			});
	});
	//[취소]버튼을 클릭하면 자동실행
	$("#join").click(function() {
		window.location.href = "join.do";
	});
	
	$("#cancle").click(function() {
		window.location.href = "main.do";
	});


</script>