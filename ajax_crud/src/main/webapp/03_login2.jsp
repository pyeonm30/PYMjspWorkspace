<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<div align="center">
		<h1>로그인</h1>

		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" id="id" name="id" required
					placeholder="아이디입력해주세요"></td>
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

	
    document.getElementById("login").addEventListener("click", ()=> {

         let id= document.getElementById("id").value;
         let passwd= document.getElementById("passwd").value;

        fetch("loginPro.do", {
          method: "POST",
          headers: {
        	  "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
          },
          body: "id="+ id +"&passwd="+ passwd
        })
        .then(response => response.text())
        .then(data => {
          if (data == 1) {
            alert("로그인 성공 ");
            location.href = "main.do";
          } else {
            alert("아이디와 패스워드를 확인해주세요");
            document.getElementById("id").value = "";
            document.getElementById("passwd").value = "";
          }
        })
        .catch(error => console.error('Error:', error));
      
    });

    // Automatically runs when you click the [Cancel] button
    document.getElementById("join").addEventListener("click", function () {
     location.href =  "join.do";
    });

    document.getElementById("cancle").addEventListener("click", function () {
      location.href = "main.do";
    });
 
</script>