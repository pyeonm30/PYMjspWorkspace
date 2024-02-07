<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <button id="sendJson"> 전송</button> <br>
     <div id="output"></div>
      <div id="result"></div>
</body>
</html>

<script>

let isClicked = false;

let jsonData = {"id":"test6","passwd":"1234","name":"Test6","address":"Bangbae","tel":"010-111-6666"};
// java model의 속성값과 일치해야한다 --:> MemberVO
let obj = {id:"test7",passwd:"1234",name:"Test7",address:"Shrine",tel:"010-111-1234"};

let memberJson = JSON.stringify(obj); //" {id:"test7",passwd:"1234",name:"Test7",address:"Shrine",tel:"010-111-1234"}"

console.log(memberJson);

  document.getElementById("sendJson").addEventListener("click",() => {
	
	  if(isClicked){ alert("이미 전송 완료"); return;}
	  isClicked= true;
    fetch("getJson.do", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: memberJson,
    })
    .then(response => response.json())
    .then(data => {
      alert(data);
      if (data === 1) {
  		let msg ="<p>전송 완료 했습니다 " + obj.name +" 회원  추가 완료</p><br>";
        document.getElementById("output").innerHTML = msg;
      }
    })
    .catch(error => console.error('Error:', error));
  });

  
  
  let check = 0;
  function idcheck(){
  	 if($("#id").val()==''){
  		 alert("아이디를 입력하세요.");
  		 $("#id").focus();
  		 $("#id").css("border", "");
  		 return;
  	 }
  	 let id=$("#id").val();
  	 // 클라이언트와 서버와 통신하는 방법 
  	 $.ajax({ 
  		 url : "${ctx}/vaildIdAjax.do",
  		 type : "POST",
  		 data : {"id" : id},
  		 success : getResult,  //함수(callback)
  		 error : function(){ alert("error"); }    		 
  	 });
  }  

  function getResult(data){    	
  	 if(data =="valid"){
  		 alert("사용가능한 id 입니다.");
  		 $("#pw").focus();
  		 $("#id").css("border", "3px blue solid")
  		 check = 1;
  	 }else if(data=="notValid"){
  		 alert("이미 사용하고 있는 id 입니다.");
  		 $("#id").val("");
  		 $("#id").focus();
  		 $("#id").css("border", "3px red solid")
  		 check = -1;
  	 } 	 
  }


  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
</script>