
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/css/carform.css">
    <main>
      <div class="inner">
        <form id="car-form" action="reservateCar.do" method="post" id="optionForm">
          <div class="car-desc">
            <h2> ${car.name} 대여 옵션 선택 </h2>
            <div class="car-photo"> <img src="upload/${car.img}">
              <p id="price" data-price="${car.price}"> 하루 랜트 당 가격 ${car.price}원</p>
            </div>
          </div>

          <table class="car-table">

            <tr>
              <td class="colname">대여기간</td>
              <td><select name="dday" id="dday">
                  <c:forEach var="i" begin="1" end="7">
                    <option value="${i}">${i}일</option>
                  </c:forEach>

                </select></td>
            </tr>
            <tr>
              <td class="colname">대여일</td>
              <td><input type="date" name="rday" id="date" size="15"></td>
            </tr>


            <tr>
              <td class="colname">보험적용</td>
              <td> <select name="usein" id="usein">
                  <option value="1">적용(1일 1만원)</option>
                  <option value="0">비적용</option>
                </select></td>
            </tr>
            <tr>
              <td class="colname">Wifi 적용</td>
              <td><select name="usewifi" id="usewifi">
                  <option value="1">적용(1일 1만원)</option>
                  <option value="0">비적용</option>
                </select></td>
            </tr>
            <tr>
              <td class="colname">네비게이션 적용</td>
              <td><select name="usenavi" id="usenavi">
                  <option value="1">적용(무료)</option>
                  <option value="0">비적용</option>
                </select></td>
            </tr>
            <tr>
              <td class="colname">베이비시트 적용</td>
              <td><select name="useseat" id="useseat">
                  <option value="1">적용(1일 1만원)</option>
                  <option value="0">비적용</option>
                </select></td>
            </tr>
            <tr>
              <td colspan="2">
              <input type="hidden" name="num" id ="num" value="${car.num}" />
              <input type="hidden" name="userId" id="userId" value="${userId}">
               <input type="hidden" name="qty" id="qty" value="${qty}">
              <button class="next-btn mybtn"> 차량 예약 하기 <span>></span></button>
              </td>
            </tr>

          </table>
        </form>

      </div>

    </main>
    
  <!--  모달  -->
  <div class="modal car-modal">
    <div class="modal-content">
      <div class="desc-header">
        <h2> 차량 예약를 확인해주세요 </h2>
        <button class="btn-close car-modal-btn"> &times; </button>
      </div>
      <div class="car-result">
        <table>
          <tr>
            <td> 차량 예약일</td>
            <td colspan="2" id="carDate"></td>
          </tr>
          <tr>
            <td> 차량 갯수</td>
            <td colspan="2" id="carCnt"></td>
          </tr>
          <tr>
            <td>
              차량 총 예약일
            </td>
            <td id="carDaysCnt"> 0 일 </td>
            <td id="carDays"> 0 원 </td>
          </tr>
          <tr>
            <td>
              차량 총 유료 옵션
            </td>
            <td id="carOptionsCnt"> 0 개 </td>
            <td id="carOptions"> 0 원 </td>
          </tr>
          <tr>
            <td>
              차량 총액 합산
            </td>
            <td colspan="2" id="carTotals"> 0 원 </td>
          </tr>

          <tr>
            <td colspan="3"> <button id="delBtn"> 예약 취소 </button> <button id="updateBtn"> 예약 확인 </button></td>
          </tr>
        </table>

      </div>

    </div>
  </div>


<%@ include file="../parts/footer.jsp"%>
<script type="text/javascript" src="script/carResult.js" ></script>
