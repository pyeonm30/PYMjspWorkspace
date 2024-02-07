package kr.basic.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.basic.model.MemberDAO;

public class FileDelController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String ctx=request.getContextPath();
		
		String filename=request.getParameter("filename");
		int num=Integer.parseInt(request.getParameter("num"));
		filename=URLEncoder.encode(filename, "UTF-8");
		
		filename=filename.replace("+", " ");
		
		String UPLOAD_DIR="file_repo";
		String uploadPath=request.getServletContext().getRealPath("")+File.separator+UPLOAD_DIR;
		File file=new File(uploadPath+"\\"+filename);
		if(file.exists()) {
			file.delete();
			System.out.println("디렉토리에서 파일 삭제");
		}
		//데이블에서도 파일을 null처리를 하자(update)
		//MemberDAO dao=;
		//dao.memberDeleteFile(num);
		
		return "redirect:"+ctx+"/memberContent.do?num="+num;
	}

}
