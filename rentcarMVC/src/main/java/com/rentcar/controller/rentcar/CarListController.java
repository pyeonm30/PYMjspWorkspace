package com.rentcar.controller.rentcar;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rentcar.dao.RentCarDAO;
import com.rentcar.frontController.Controller;
import com.rentcar.vo.Rentcar;

public class CarListController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String kind = request.getParameter("kind");
		String title="";
		ArrayList<Rentcar> list = null;
		if(kind.equals("recent")) {
			list = (ArrayList<Rentcar>)RentCarDAO.getInstance().getRecentCarlist();
			title="최근 업데이트 렌트카";
		}else if(kind.equals("all")) {
			title="전체 렌트카 ";
			list = (ArrayList<Rentcar>)RentCarDAO.getInstance().getAllCarlist();
		
		}else if(kind.equals("small")) {
			title="소형 렌트카 ";
			list = (ArrayList<Rentcar>)RentCarDAO.getInstance().getCategoryCarlist(1);
		}else if(kind.equals("medium")) {
			title="중형 렌트카 ";
			list = (ArrayList<Rentcar>)RentCarDAO.getInstance().getCategoryCarlist(2);
		}else if(kind.equals("large")) {
			title="대형 렌트카 ";
			list = (ArrayList<Rentcar>)RentCarDAO.getInstance().getCategoryCarlist(3);
		}
		
		System.out.println("전체 차량 \n" + list);
		request.setAttribute("list", list);
		request.setAttribute("title", title);
		return "rentcar/rentCarList";
	}

}
