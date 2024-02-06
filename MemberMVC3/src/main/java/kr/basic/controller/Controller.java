package kr.basic.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// pojo -> 서블릿이 아닌 일반 자바 클래스 
public interface Controller {

	  public String requestHandler(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException;
}
