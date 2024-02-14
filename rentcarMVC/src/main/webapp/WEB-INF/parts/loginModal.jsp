<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <div class="modal login-modal">
    <div class="modal-content">
      <div class="desc-header">
        <!-- <p> 렌트카 예약을 위해서는 로그인 먼저 해주세요</p> -->
        <button class="btn-close login-close"> &times; </button>
      </div>
      <form id="loginForm" >
        <div class="row">
          <div class="field">
            <label> 아이디 </label>
            <input type="text" name="id" required placeholder="아이디을 입력하세요.">
          </div>
          <div class="field">
            <label> 비밀번호 </label>
            <input type="password" name="pw" required placeholder="비밀번호를 입력하세요.">
          </div>
        </div>

        <input type="button" class="btn-send login-btn" onclick="loginAjax(form)" value="Login" />

      </form>
    </div>
  </div>
  </div>

  <div class="overlay"></div>