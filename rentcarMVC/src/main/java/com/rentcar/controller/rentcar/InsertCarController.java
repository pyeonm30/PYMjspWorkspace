package com.rentcar.controller.rentcar;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.rentcar.dao.RentCarDAO;
import com.rentcar.frontController.Controller;
import com.rentcar.vo.Rentcar;
import com.rentcar.vo.Reservation;


public class InsertCarController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		String jsonData = request.getReader().readLine();
		System.out.println("jsonData=" + jsonData);
        Gson gson = new Gson();
		Rentcar car = gson.fromJson(jsonData, com.rentcar.vo.Rentcar.class);
		System.out.println("car= " + car);
        
		int check = RentCarDAO.getInstance().insertRentcar(car);
		if(check == 1) {
			response.getWriter().print(check);
			
		}else {
			response.getWriter().print("fali");
		}
		
		return null;

	}

}
