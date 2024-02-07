<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

    document.getElementById("delete").addEventListener("click", function () {
    	
    	if(document.getElementById("passwd").value.trim().length == 0){
    		alert("값을 입력해주세요 ")
    		return;
    	}
    	
      fetch("deletePro.do", {
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
        },
        body: "passwd=" + document.getElementById("passwd").value,
      })
      .then(response => response.text())
      .then(data => {
        if (data == 1) {
          alert("회원 탈퇴 완료");
          location.href = "main.do";
        } else if (data == -1) {
          alert("비밀번호가 올바르지않습니다");
          document.getElementById("passwd").value = "";
          document.getElementById("passwd").focus();
        }
      })
      .catch(error => console.error('Error:', error));
    });
  
</script>