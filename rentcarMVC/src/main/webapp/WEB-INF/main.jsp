
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./parts/header.jsp"%>

    <main>
      <div class="inner">
        <h2> 연미 렌트카 메인 페이지 </h2>
        <div class="slider">
          <div class="slide"> <img src="img/1.jpg" /></div>
          <div class="slide"><img src="img/2.jpg" /></div>
          <div class="slide"><img src="img/3.jpg" /></div>
        </div>

      </div>
    </main>
<%@ include file="./parts/footer.jsp"%>

<c:if test="${ !empty msg}"> 
	<script>
	  window.addEventListener('load',()=>{ actvieMsgModal('${msg}')});
	</script>
</c:if>