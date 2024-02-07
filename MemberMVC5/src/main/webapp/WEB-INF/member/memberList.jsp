<%@page import="kr.basic.model.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.basic.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "../../header.jsp" %>
<script type="text/javascript">
  function deleteFn(id){
	  location.href="${ctx}/memberDelete.do?id="+id; 
  }
  
</script>
<div class="container">
  <h2>상세화면</h2>
  <div class="panel panel-default">
    <div class="panel-heading">
     <c:if test="${log }">
       <label>${sessionScope.userName}님이 로그인 하셨습니다.</label>
     </c:if>
     <c:if test="${sessionScope.userId==null || sessionScope.userId==''}">
      <label>안녕하세요</label>
     </c:if>   
    </div>
    <div class="panel-body">
    <form id="form1" name="form1" class="form-horizontal" method="post">
      <input type="hidden" name="num" value="${vo.num}"/>
      <div class="form-group">
         <label class="control-label col-sm-2">번호:</label>
         <div class="col-sm-10">
           <c:out value="${vo.num}"/>
         </div>
      </div>   
      <div class="form-group">
         <label class="control-label col-sm-2">아이디:</label>
         <div class="col-sm-10">
           <c:out value="${vo.id}"/>
         </div>
      </div> 
       <div class="form-group">
         <label class="control-label col-sm-2">비밀번호:</label>
         <div class="col-sm-10">
           <c:out value="${vo.pass}"/>
         </div>
      </div>  
       <div class="form-group">
         <label class="control-label col-sm-2">이름:</label>
         <div class="col-sm-10">
           <c:out value="${vo.name}"/>
         </div>
      </div> 
       <div class="form-group">
         <label class="control-label col-sm-2">나이:</label>
         <div class="col-sm-10">
           <input type="text" class="form-control" id="age" name="age" value="${vo.age}" style="width: 10%">
         </div> 
      </div> 
       <div class="form-group">
         <label class="control-label col-sm-2">이메일:</label>
         <div class="col-sm-10">
           <input type="text" class="form-control" id="email" name="email" value="${vo.email}" style="width: 30%">
         </div>
      </div> 
       <div class="form-group">
         <label class="control-label col-sm-2">전화번호:</label>
         <div class="col-sm-10">
           <input type="text" class="form-control" id="phone" name="phone" value="${vo.phone}" style="width: 30%">
         </div>
      </div> 
     </form>
    </div>
    <div class="panel-footer" style="text-align: center;"> 
       <c:if test="${!empty sessionScope.userId}">
         <c:if test="${sessionScope.userId==vo.id}">
          <input type="button" value="수정하기" class='btn btn-primary' onclick="update()"/>
         </c:if>
       
         <c:if test="${sessionScope.userId!=vo.id}">
          <input type="button" value="수정하기" class='btn btn-primary' onclick="update()" disabled="disabled"/>
         </c:if> 
       </c:if> 
       <input type="button" value="취소" class='btn btn-warning' onclick="frmreset()"/>
       <input type="button" value="리스트" onclick="location.href='${ctx}/memberList.do'" class='btn btn-success'/>
    </div>
  </div>
</div>


</body>
</html>