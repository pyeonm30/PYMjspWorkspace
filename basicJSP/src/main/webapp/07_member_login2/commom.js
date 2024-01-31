function goBack(msg){
	alert(msg);
	history.back();
}

function msgUrl(msg, url){
	alert(msg);
	location.href=url;
}

function msgGoMain(msg){
	alert(msg);
	location.href="main.jsp";
}

function msgError(){
	alert("잘못된 접근입니다");
	history.back();
}