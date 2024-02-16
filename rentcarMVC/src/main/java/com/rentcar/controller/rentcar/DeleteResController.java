package com.rentcar.controller.rentcar;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rentcar.dao.RentCarDAO;
import com.rentcar.dao.ReservationDAO;
import com.rentcar.frontController.Controller;
import com.rentcar.vo.Rentcar;
import com.rentcar.vo.Reservation;


public class DeleteResController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int regNo = Integer.parseInt(request.getParameter("regNo"));
		
		Reservation book = ReservationDAO.getInstance().getOneReservation(regNo);
		RentCarDAO.getInstance().addTotalQty(book);
		int cnt = ReservationDAO.getInstance().deleteAReservation(regNo);
		
		if(cnt == 0) {
			System.out.println(" 삭제 실패");
		}else {
			System.out.println(" 삭제 성공");
			
		}
		
		
		return "redirect:/main.do";
	}

}
