
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/css/car.css">


    <main>
      <div class="inner">

          <aside>
            <ul>
              <li onclick="location.href='${ctx}/carList.do?kind=all'">전체</li>
              <li onclick="location.href='${ctx}/carList.do?kind=small'">소형</li>
              <li onclick="location.href='${ctx}/carList.do?kind=medium'">중형</li>
              <li onclick="location.href='${ctx}/carList.do?kind=large'">대형</li>
            </ul>
          </aside>
       <div class="car-content">
              <h2> ${title} 조회</h2>
          <div class="itemWrap">
            <c:forEach var="vo" items="${list}">
              <div class="item" onclick="location.href='${ctx}/rentcarInfo.do?num=${vo.num}'">
                <div class="imgBox">
                  <img src="${ctx}/img/${vo.img}" alt="${vo.name}">
                </div>
                <div class="textBox">
                  <p class="textBox__name">${vo.name}&nbsp; ${vo.company}</p>
                  <p class="textBox__price">${vo.price}원</p>
                </div>
              </div>
          </c:forEach>
           </div>
        </div>

      </div>

    </main>




<%@ include file="../parts/footer.jsp"%>
