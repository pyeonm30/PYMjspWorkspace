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

		<h1>회원 가입</h1>

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
  //let contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));

  let isValidId = false;
  function sendFetchRequest(url, method, query, successCallback) {
	 
	
    fetch(url, {
      method: method,
      headers: {
    	  "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
      },
      body:query   // "id=123&pw=123"
    })
      .then(response => response.text())
      .then(data => successCallback(data))
      .catch(error => console.error('Error:', error));
  }


  document.getElementById("checkId").addEventListener("click", () => {
    let query = "id="+document.getElementById("id").value;
    
    if (document.getElementById("id").value) {
    	
      sendFetchRequest("confirm.do", "POST", query,(data)=> {
    
        if (data == 1) {
          alert('사용할 수 없는 id 입니다');
          document.getElementById("id").value = ''; 
          isValidId = false;
        } else {
          alert('사용할 수 있습니다');
          document.getElementById("passwd").focus();
          isValidId = true;
        }
      });
      
    } else {
      alert("사용할 아이디를 입력");
      document.getElementById("id").focus();
    }
  });


  document.getElementById("join").addEventListener("click", ()=>{
	  if(!isValidId){
		    alert('ID 중복 확인 먼저 해주세요');
		    return;
	  }
	  
	  if(document.getElementById("passwd").value!== document.getElementById("repass").value){
		  console.log(document.getElementById("passwd").value);
		  console.log(document.getElementById("repass").value);
		  
		    alert('패스워드 재 입력값이 다릅니다 ');
		  return;
	  }
	  
      let query = 
        "id="+document.getElementById("id").value
        +"&passwd="+document.getElementById("passwd").value
        +"&name="+document.getElementById("name").value
        +"&address="+document.getElementById("address").value
        +"&tel="+document.getElementById("tel").value;
      
        
        console.log("query=" + query);
      
      sendFetchRequest("joinPro.do", "POST", query, (data)=> {
    	  if(data == 1){
        alert("회원가입을 축하합니다.");
        location.href = "main.do";
    	  } else{
    	        alert("회원가입 실패.");
    	        location.href = "main.do";
    	  }
      });
  });

  document.getElementById("cancle").addEventListener("click", () => {
    location.href = "main.do";
  });



</script>