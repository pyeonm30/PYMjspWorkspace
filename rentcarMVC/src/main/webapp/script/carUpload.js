let actvieuploadModal = () => {
  document.querySelector('.upload-modal').classList.add('active');
  document.querySelector('.overlay').classList.add('active');
}
let deActvieuploadModal = () => {
  document.querySelector('.upload-modal').classList.remove('active');
  document.querySelector('.overlay').classList.remove('active');
}

document.querySelector('#inputImg').addEventListener('click', actvieuploadModal);
document.querySelector(".upload-close").addEventListener('click', deActvieuploadModal);
document.querySelector('#addForm').addEventListener("submit", (event) => {
  event.preventDefault();
  console.log(event);
})

document.querySelector('#addForm').addEventListener("submit", (event) => {
  event.preventDefault();
})
document.querySelector('#imgForm').addEventListener("submit", (event) => {
  event.preventDefault();
})


function checkImg(fname, fsize) {
  let fileForm = /(.*?)\.(jpg|jpeg|JPG|JPEG|PNG|png)$/;
  let maxSize = 10 * 1024 * 1024;
  if (fname !== "" && fname !== null) {
    if (!fname.match(fileForm)) {
      alert("이미지 파일만 업로드 가능합니다 ");
      return false;
    } else if (fsize >= maxSize) {
      alert("파일 사이즈는 10MB 미만만 가능합니다");
      return false;
    }
  }
  return true;
}

function uploadFile() {
  let form = document.getElementById('imgForm');
  let formData = new FormData(form);

  fetch('uploadCarImg.do', {
      method: 'POST',
      body: formData,
      contentType: false,
      processData: false
    })
    .then(response => response.text())
    .then(data => {
      if (data === 'fail') {
        alert('파일업로드 실패 ');
      } else {
        alert(data + "파일 업로드 성공");
        let src = "upload/" + data;
        console.log("src=" + src);
       document.querySelector('#inputImg').setAttribute("src", src);
       document.querySelector('#imgVal').setAttribute("value", data);

      }
    });
}


function insertCar() {
  let check = true;
  let inputs = [...document.querySelectorAll(".fv")];
  inputs.forEach(input => input.value = input.value.trim())
  check = inputs.every(input => (input.value.length > 0))

  if (!check) {
    alert(" 모든 값은 필수 입니다");
    return;
  }
  let price = inputs[2].value;
  let usepeople = inputs[3].value;
  let totalQty = inputs[4].value;


  if (price < 1000 || price > 1000000) {
    alert(' 가격은 1000-1000000 사이값을 넣어주세요');
    inputs[2].value="";
    return;
  }
  if (usepeople < 0 || usepeople > 10) {
	  inputs[3].value=""
    alert(' 탑승인원은 1-10 사이값을 넣어주세요');
    return;
  }

  if (totalQty < 0 || totalQty > 10) {
    alert(' 총 재고수량은 1-10 사이값을 넣어주세요');
        inputs[4].value="";
    return;
  }

  //console.log(check, "테스트 성공");

  //inputs.forEach((input) => console.log(input));


  let car = {
    num: null,
    name: inputs[0].value,
    category: inputs[1].value,
    price: inputs[2].value,
    usepeople: inputs[3].value,
    totalQty: inputs[4].value,
    company: inputs[5].value,
    info: inputs[6].value,
    img: inputs[7].value
  }

  carInsertAjax(car)


}


let categoryInputs = [...document.querySelectorAll('input[name="category"]')];
let isUpload = false;
categoryInputs.forEach((input) => {
  input.addEventListener("change", function() {
    categoryInputs.forEach(function(cInput) {
      cInput.classList.remove('fv');
    });

    if (input.checked) {
      input.classList.add('fv');
    }
  });
});

function carInsertAjax(car) {

  fetch("insertCar.do", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(car)
    })
    .then(response => response.json())
    .then(data => {
      if (data == 1) {
        actvieMsgModal("렌트카 예약 성공");
        //location.href = ctx + "/main.do";
      }else{
		 actvieMsgModal("렌트카 예약 실패"); 
	  }
    })
    .catch(error => console.error('Error:', error));
    
    setTimeout(()=>{
		location.href=ctx+"/carList.do?kind=recent";
	},200)

}


function uploadImg() {

  if (isUpload) {
    alert('이미 업로드 처리 중 ')
    return;
  }

  let file = document.querySelector('#formFile').files[0];
  if (!file) {
    alert('파일 업로드 먼저 해주세요')
    return;
  }
  // console.log(file.name);
  // console.log(file.type);
  // console.log(file.size);
  let check = checkImg(file.name, file.size);

  if (!check) return;
  else {

    isUpload = true;
    uploadFile();
    deActvieuploadModal();
  }


}