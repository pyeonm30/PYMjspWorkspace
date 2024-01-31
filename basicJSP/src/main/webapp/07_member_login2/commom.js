function goUrl( url ){
	location.href=url;
}

function msgUrl(msg, url){
	alert(msg);
	location.href=url;
}

function msgGoMain(msg){
	alert(msg);
	location.href="02_main.jsp";
}

function msgError(){
	alert("잘못된 접근입니다");
	location.href="02_main.jsp";
}