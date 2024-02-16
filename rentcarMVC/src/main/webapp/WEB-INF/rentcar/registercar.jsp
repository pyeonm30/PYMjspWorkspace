<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
  <script type="text/javascript" src="./carUpload.js" defer></script>
<main>
      <div class="inner">
        <div class="insert-car">

          <form id="addForm" action="insertCar.do" method="post">
            <div>
              <table class="upload-table">
                <tr>
                  <td rowspan="9" class="img-td"><img name="img" id="inputImg"
                      src="https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg" />
                  </td>
                </tr>
                <tr>
                  <td>차량이름</td>
                  <td><input class="fv" type="text" name="name" value="test" /></td>
                </tr>
                <tr>
                  <td>차량분류</td>
                  <td class="radio-td"><input type="radio" name="category" value="1" class="fv" checked /> 소형
                    &nbsp; <input type="radio" name="category" value="2" /> 중형 &nbsp;
                    <input type="radio" name="category" value="3" /> 대형 &nbsp;
                  </td>
                </tr>
                <tr>
                  <td>렌트 가격</td>
                  <td><input class="fv" type="number" name="price" value="1000" /></td>
                </tr>
                <tr>
                  <td>승차 인원</td>
                  <td><input class="fv" type="number" name="usepoeple" value="4" /></td>
                </tr>
                <tr>
                  <td>재고 수량</td>
                  <td><input class="fv" type="number" name="totalQty" value="3" /></td>
                </tr>
                <tr>
                  <td>제조 회사</td>
                  <td><input class="fv" type="text" name="company" value="기아" /></td>
                </tr>
                <tr>
                  <td>차랑 정보</td>
                  <td><textarea class="fv" name="info"> 추가한 차량입니다 </textarea></td>
                </tr>

                <tr height="40">
                  <input class="fv" id="imgVal" type="hidden" name="img" value="" />
                  <td colspan="2"><input type="button" class="upload-btn" value="차량 등록" onclick="insertCar()" /></td>
                </tr>
              </table>

          </form>
        </div>
      </div>
    </main>
    
  <div class="modal upload-modal">
    <div class="modal-content">
      <p> 차량 이미지 등록 </p>
      <button class="btn-close upload-close"> &times; </button>
      <form id="imgForm" action="uploadCarImg.do" method="post" enctype="multipart/form-data">
        <input type="file" id="formFile" type="file" name="uploadFile" accept="image/*">
      </form>
      <button class="upload-btn" onclick="uploadImg()"> 이미지 등록</button>
    </div>
  </div>


<%@ include file="../parts/footer.jsp"%>


<script type="text/javascript" src="script/carUpload.js" defer></script>