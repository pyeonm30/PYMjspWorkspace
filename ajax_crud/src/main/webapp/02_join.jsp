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
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="email" id="id" name="id" required ></td>
				<td><button id="checkId">ID중복확인</button></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td colspan="2"><input type="password" id="passwd"
					name="passwd" required></td>
			</tr>
			<tr>
				<td>패스워드 재입력</td>
				<td colspan="2"><input type="password" id="repass"
					name="repass" required></td>
			</tr>
			<tr>
				<td>이름</td>
				<td colspan="2"><input type="text" id="name" name="name"  required></td>
			</tr>
			<tr>
				<td>주소</td>
				<td colspan="2"><input type="text" id="address" name="address"  required></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td colspan="2"><input type="tel" id="tel" name="tel"  required></td>
			</tr>
			<tr>
				<td colspan="3">
					<button id="join">가입하기</button>
					<button id="cancle">취소</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>

<script>

		$("#checkId").click(function() {
			if ($("#id").val()) {
				let query = {
					id : $("#id").val()
				};

				$.ajax({
					type : "post",//요청방식
					url : "confirm.do",//요청페이지
					data : query,//파라미터
					success : function(data) {//요청페이지 처리에 성공시			
						//alert(data);
						//alert(val)
						if (data === "1") {
							alert('사용할 수 없는 id 입니다');
							 $("#id").val(''); // 인풋값 초기화
						} else {
							alert('사용할 수 있습니다');
							$("#passwd").focus();
						}
					}

				});
			} else {//아이디를 입력하지 않고 [ID중복확인]버튼을 클릭한 경우
				alert("사용할 아이디를 입력");
				$("#id").focus();
			}
		});

		//[가입하기]버튼을 클릭하면 자동실행
		$("#join").click(function() {
		
				let query = {
					id : $("#id").val(),
					passwd : $("#passwd").val(),
					name : $("#name").val(),
					address : $("#address").val(),
					tel : $("#tel").val()
				};

				$.ajax({
					type : "post",
					url : "joinPro.do",
					data : query,
					success : function(data) {
						alert("회원가입을 축하합니다.");
						window.location.href = "main.do";
					}

				});
			
		});

		//[취소]버튼을 클릭하면 자동실행
		$("#cancle").click(function() {
			window.location.href = "main.do";
		});

</script>