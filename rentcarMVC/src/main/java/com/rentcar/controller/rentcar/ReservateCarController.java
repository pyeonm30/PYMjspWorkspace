package com.rentcar.controller.rentcar;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.rentcar.dao.RentCarDAO;
import com.rentcar.dao.ReservationDAO;
import com.rentcar.frontController.Controller;
import com.rentcar.vo.JoinCarView;
import com.rentcar.vo.Rentcar;
import com.rentcar.vo.Reservation;


public class ReservateCarController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		
		request.setCharacterEncoding("utf-8");

		String jsonData = request.getReader().readLine();
		System.out.println("jsonData=" + jsonData);
        Gson gson = new Gson();
		Reservation book = gson.fromJson(jsonData,com.rentcar.vo.Reservation.class);
		int cnt = ReservationDAO.getInstance().addReservation(book);
		RentCarDAO.getInstance().reduceTotalQty(book);

		if(cnt == 1) {
			response.getWriter().print(cnt);
			
		}else {
			response.getWriter().print("fali");
		}
		

	 	

		return null;
	 	}


}
