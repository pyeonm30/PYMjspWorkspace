<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div align="center">
	<h2>회원정보 수정</h2>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="email" id="id" name="id" value="${sessionScope.id}" readonly disabled></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" id="passwd" name="passwd" placeholder="수정위해서 비번입력 필수"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" id="name" name="name" value="${member.name}"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" id="address" name="address"
				value="${member.address}"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="tel" id="tel" name="tel"
				value="${member.tel}"></td>
		</tr>
		<tr>
			<td colspan="2">
				<button id="update">수정</button>
			</td>
		</tr>
	</table>
</div> 

<script>
  document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("update").addEventListener("click", function () {
      let inputs = {
        "id":document.getElementById("id").value,
        "passwd":document.getElementById("passwd").value,
        "name":document.getElementById("name").value,
        "address":document.getElementById("address").value,
        "tel":document.getElementById("tel").value
      };
      
      console.log(JSON.stringify(inputs))

      fetch("updatePro.do", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(inputs)
      })
      .then(response => response.text())
      .then(data => {
        if (data == 1) {
          alert("회원정보 수정완료");
          location.href = "main.do";
        } else {
          alert("회원 정보 수정 실패");
        }
      })
      .catch(error => console.error('Error:', error));
    });
  });
</script>