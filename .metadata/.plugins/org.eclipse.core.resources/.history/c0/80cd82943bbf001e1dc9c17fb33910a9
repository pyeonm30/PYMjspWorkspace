<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

// session 값 삭제하는 방법 2가지 

// removeAttribute 는 현재 세션 객체는 유효하고 특정 세션 값만 삭제 
// session.removeAttribute("name");
 //session.removeAttribute("user");
 
 // invalidate 현재 세션 객체 자체를 무효화 시킴 
 session.invalidate();

%>

<script type="text/javascript">
   alert("로그아웃 성공 ");
   location.href="index.jsp";
</script>