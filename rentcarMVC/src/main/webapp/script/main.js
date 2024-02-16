let ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
let actvieLoginModal = ()=>{
  document.querySelector('.login-modal').classList.add('active');
  document.querySelector('.overlay').classList.add('active');
}
let deActvieLoginModal = ()=>{
  document.querySelector('.login-modal').classList.remove('active');
  document.querySelector('.overlay').classList.remove('active');
}

let actvieMsgModal = (sysMsg)=>{
  document.querySelector('.msg-modal').classList.add('active');
  document.querySelector('.overlay').classList.add('active');
  let msg = document.querySelector('.msg');
  msg.innerHTML= sysMsg;

}
let deActvieMsgModal = ()=>{
  document.querySelector('.msg-modal').classList.remove('active');
  document.querySelector('.overlay').classList.remove('active');
}

document.querySelector('.login-open').addEventListener('click', actvieLoginModal);
document.querySelector('.login-close').addEventListener('click', deActvieLoginModal);
document.querySelector('.msg-close').addEventListener('click', deActvieMsgModal);

function loginAjax(form){

         let id= form.id.value.trim();
         let pw= form.pw.value.trim();

		if(id.length == 0 || pw.length == 0){
			alert('값을 다 넣어주세요')
			return;
		}

        fetch("loginCheck.do", {
          method: "POST",
          headers: {
        	  "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
          },
          body: "id="+ id +"&pw="+ pw
        })
        .then(response => response.text())
        .then(data => {
			deActvieLoginModal();
          if (data!== "null") {
               actvieMsgModal( data+"님 로그인하셨습니다 ");
               document.querySelector('.login-user').style.display="block";
               document.querySelector('.all-user').style.display="none";
               document.querySelector('.login-user').children[0].innerHTML=" [ " + data+ " ] 님"
               document.querySelector('.login-user').children[0].href=ctx+"/userInfo.do";
          } else {
				actvieMsgModal( "로그인 실패");	
          }

        })
        .catch(error => console.error('Error:', error));
         form.id.value ="";
		 form.pw.value ="";
      }
      
function init(userId){
	if(!userId){ // 세션 id 값이 있으면
		document.querySelector('.login-user').style.display="none";
        document.querySelector('.all-user').style.display="block";
	}else{
		document.querySelector('.login-user').style.display="block";
        document.querySelector('.all-user').style.display="none";
	}
}

document.querySelector('.logout-btn').addEventListener('click', ()=>{
	      fetch("loginOut.do", {
          method: "GET",
        })
        .then(response => response.text())
        .catch(error => console.error('Error:', error));
         actvieMsgModal("로그아웃 성공 ");
         
        setTimeout(()=>{
			location.href=ctx+"/main.do";
		},500)
   
});


