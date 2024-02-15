
let actvieCarModal = () => {
  document.querySelector('.car-modal').classList.add('active');
  document.querySelector('.overlay').classList.add('active');
}
let deActvieCarModal = () => {
  document.querySelector('.car-modal').classList.remove('active');
  document.querySelector('.overlay').classList.remove('active');
}

const form = document.querySelector('#car-form');
form.addEventListener("submit", (event) => {
  event.preventDefault();
  checkValue();
});

document.querySelector('.car-modal-btn').addEventListener("click", deActvieCarModal);
let carReservation = {
  reserveSeq : null,
  num: document.querySelector("#num").value,
  qty: document.querySelector("#qty").value,
};

let today = new Date().toISOString().split("T")[0];
document.querySelector("#date").value = today;
document.querySelector("#date").min = today;
let isSend = false;

function checkValue() {
  let date = document.querySelector("#date")?.value;
  let dday = document.querySelector("#dday")?.value;
  let rentDate = new Date(date);
  let endDate = new Date(rentDate);
  endDate.setDate(rentDate.getDate() + Number(dday));


  let uesin = document.querySelector("#usein")?.value;
  let usenavi = document.querySelector("#usenavi")?.value;
  let usewifi = document.querySelector("#usewifi")?.value;
  let useseat = document.querySelector("#useseat")?.value;
  let carQty = document.querySelector("#qty").value;

  let carCnt = document.querySelector("#carCnt");
  let carDate = document.querySelector("#carDate");
  let carDaysCnt = document.querySelector("#carDaysCnt");
  let carDays = document.querySelector("#carDays");
  let carOptionsCnt = document.querySelector("#carOptionsCnt");
  let carOptions = document.querySelector("#carOptions");
  let carTotals = document.querySelector("#carTotals");

  let price = document.querySelector("#price")?.dataset?.price;

  carCnt.innerHTML = carQty + "개 ("+ price +" 원)";
  carDate.innerHTML = date + " ~ " + endDate.getFullYear() + "-" + (endDate.getMonth() + 1) + "-" + endDate.getDate();
  carDaysCnt.innerHTML = dday + "일 * " + carQty + "개";
  carDays.innerHTML = (price * dday * carQty) + "원";
  let totalCnt = 0;
  totalCnt = uesin==1? totalCnt + 1 : totalCnt;
  totalCnt = useseat==1 ? totalCnt + 1 : totalCnt;
  totalCnt = usewifi==1? totalCnt + 1 : totalCnt;
  carOptionsCnt.innerHTML = totalCnt + "개 * " + carQty + "개";;


  carOptions.innerHTML = (totalCnt * 10000 * carQty) + "원";
  carTotals.innerHTML = (price * dday + totalCnt * 10000 * dday) * carQty + "원";

  carReservation['dday'] = dday;
  carReservation['rday'] = date;
  carReservation['usein'] = uesin;
  carReservation['usewifi'] = usewifi;
  carReservation['useseat'] = useseat;
  carReservation['usenavi'] = usenavi;

  actvieCarModal();

}

document.querySelector('#delBtn').addEventListener("click", deActvieCarModal);
document.querySelector('#updateBtn').addEventListener("click", () => {
	carReservation['userid'] = document.querySelector('#userId').value;
  if (isSend) {
	  alert("이미 예약 완료 했습니다");
	  return;
	  }
  carReservationAjax();
  isSend = true;
});

function carReservationAjax() {

  fetch("reservateCar.do", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(carReservation),
    })
    .then(response => response.json())
    .then(data => {
      if (data == 1) {
          actvieMsgModal("렌트카 예약 성공 ");
         
        setTimeout(()=>{
			location.href=ctx+"/main.do";
		},500)
      }else{
		  
	  }
    })
    .catch(error => console.error('Error:', error));

}

(()=> {
let ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	if(!document.querySelector('#userId').value){
	 alert(" 로그인 먼저 해주세요 ");
	 location.href=ctx+"/main.do";
	 }
})();
