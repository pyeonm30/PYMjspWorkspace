package kr.basic.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// pojo -> 서블릿이 아닌 일반 자바 클래스 
public interface Controller {
    // frontController 에서 만들어진 request, respone 객체를 외부에서 가져온다 
	  public String requestHandler(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException;
}
