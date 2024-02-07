package controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.JsonElement;

import member.MemberDAO;
import member.MemberVO;

@SuppressWarnings("serial")
@WebServlet("/updatePro.do")
public class _07_UpdatePro extends HttpServlet {
       

//	
//	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		MemberVO member = new MemberVO();
//		String id = request.getParameter("id");
//		String passwd  = request.getParameter("passwd");
//		String name = request.getParameter("name");
//		String address = request.getParameter("address");
//		String tel = request.getParameter("tel");
//		
//		member.setId(id);
//		member.setPasswd(passwd);
//		member.setName(name);
//		member.setAddress(address);
//		member.setTel(tel);
//
//		
//		int check =  MemberDAO.getInstance().updateMember(member);
//		response.getWriter().print(check);
//	}
//	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		StringBuffer bf = new StringBuffer();
		String line = null;
		try {
			BufferedReader reader = request.getReader();
			while ((line = reader.readLine()) != null)
				bf.append(line);
			System.out.println("test=" + bf.toString());
			
			JSONParser jp = new JSONParser();
			JSONObject jb = (JSONObject)jp.parse(bf.toString());
		
			MemberVO member = new MemberVO();
			member.setId((String)jb.get("id"));
			member.setPasswd((String)jb.get("passwd"));
			member.setName((String)jb.get("name"));
			member.setAddress((String)jb.get("address"));
			member.setTel((String)jb.get("tel"));
			
			System.out.println("test2=" + member);
			
			int check =  MemberDAO.getInstance().updateMember(member);
			System.out.println("check=" + check);
			
			response.getWriter().print(check);
		} catch (Exception e) { 
			e.printStackTrace();
		}


	}
	
	
}
