
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/css/carform.css">
<main>
      <div class="inner">
        <form id="car-form" action="${ctx}/selectCarOption.do" method="post">
          <div class="car-desc">
            <div class="car-photo">
              <img alt="${vo.name}" src="upload/${vo.img}" >
            </div>
            <h2 size="5" color="gray">차량 정보 </h2>
            <p>${vo.info }</p>
          </div>
          <table class="car-table">
            <tr>
              <td colspan="2">
                <h2> ${vo.name} 차 량 선 택 </h2>
              </td>
            </tr>
            <tr>
              <td class="colname">차 량 수 량</td>
              <td class="left"><select name="qty" id="qtyVal">
                  <c:forEach var="i" begin="1" end="${vo.totalQty}">
                  <option value="${i}">${i}</option>
                  </c:forEach>
                </select></td>
            </tr>
            <tr>
              <td class="colname">차 량 분 류</td>
              <td class="left">
                <c:if test="${vo.category eq '1'}">
                  <c:out value="소형" />
                </c:if>
                <c:if test="${vo.category eq '2'}">
                  <c:out value="중형" />
                </c:if>
                <c:if test="${vo.category eq '3'}">
                  <c:out value="대형" />
                </c:if>
              </td>
            </tr>
            <tr>
              <td class="colname">대 여 가 격</td>
              <td class="left">${vo.price }원</td>
            </tr>
            <tr>
              <td class="colname">제 조 회 사</td>
              <td class="left">${vo.company }</td>
            </tr>
            <tr>
              <td colspan="2">
                <input type="hidden" name="num" value="${vo.num}"/>
                <button class="next-btn mybtn">옵션선택후 구매하기 <span>></span></button>

              </td>
            </tr>
          </table>

        </form>

      </div>

    </main>
<%@ include file="../parts/footer.jsp"%>
