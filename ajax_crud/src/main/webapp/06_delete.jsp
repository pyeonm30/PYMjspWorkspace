<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
	<div align="center">
		<h2>회원정보 수정</h2>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>${id}</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="passwd" name="passwd" required></td>
			</tr>
			<tr>

				<td colspan="2"><input type="button" id="delete" value="탈퇴"></td>
			</tr>
		</table>
	</div>
</body>
</html>

<script>
	$("#delete").click(function() {//[회원정보수정]버튼 클릭

		$.ajax({
				type : "POST",
				url : "deletePro.do",
				data : {passwd : $("#passwd").val()},
				success : function(data) {
					console.log("data=" + data)
;					if (data == 1) {
						alert("회원가입탈퇴");
						window.location.href = "main.do";
					}else if(data == -1){
						alert("비밀번호가 맞지 않습니다.");
						$("#passwd").val("");
						$("#passwd").focus();
					}
				}
	
			});
		} 
	  )

</script>