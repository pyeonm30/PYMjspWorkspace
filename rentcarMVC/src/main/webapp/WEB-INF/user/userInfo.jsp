<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../parts/header.jsp"%>

    <main>
      <div class="inner">
        <div class="member-content">
          <h2>${vo.name} 회원의상세보기</h2>
          <p id="msg2"></p>
          <input type="hidden" name="num" value="${vo.num}" />
          <input type="hidden" name="pwd" id="pwd" value="${vo.pwd}"/>
          <table>
            <tr>
              <td>아이디</td>
              <td id="userid">${vo.userid}</td>
            </tr>
            <tr>
              <td>이름</td>
              <td>${vo.name}</td>
            </tr>
            <tr>
              <td>이메일</td>
              <td><input id="email" type="text" name="email" value="${vo.email}" /></td>
            </tr>
            <tr>
              <td>전화번호</td>
              <td><input id="phone" type="text" name="phone" value="${vo.phone}" /></td>
            </tr>

            <tr>
              <td colspan="2"><button id="delBtn">회원 탈퇴</button>
                <button id="updateBtn">회원 수정</button>
              </td>
            </tr>
          </table>
        </div>
      </div>

    </main>

<%@ include file="../parts/footer.jsp"%>