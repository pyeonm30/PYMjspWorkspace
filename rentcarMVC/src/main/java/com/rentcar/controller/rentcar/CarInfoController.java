package com.rentcar.controller.rentcar;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rentcar.dao.RentCarDAO;
import com.rentcar.frontController.Controller;
import com.rentcar.vo.Rentcar;
	

public class CarInfoController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int num = Integer.parseInt(request.getParameter("num"));
		Rentcar vo = RentCarDAO.getInstance().getOneCar(num);
		
	     System.err.println("vo=" + vo);

		request.setAttribute("vo", vo);
		return "rentcar/rentcarInfo";
	}

}
