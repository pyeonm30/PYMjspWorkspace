package com.rentcar.controller.user;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rentcar.frontController.Controller;
import com.rentcar.vo.User;

public class UserInfoController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		User user = com.rentcar.dao.UserDAO.getInstance().getOneUser(id);
		if(user!= null) {
		request.setAttribute("vo", user);
		return "user/userInfo";
		}else {
			System.out.println("db연동실패 UserDAO.getInstance().getOneUser(id)");
			return "main";
		}
	
	}

}
