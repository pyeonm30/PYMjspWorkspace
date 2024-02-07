package kr.basic.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.basic.utils.FileUtil;

public class FileAddController implements Controller{
	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String fileName ="";
		try {
		    String saveDirectory = request.getServletContext().getRealPath("/Uploads");
		    System.out.println("saveDirectory=" + saveDirectory);
		    
		    //파일 업로드 하기
		    String originalFileName = FileUtil.uploadFile(request, saveDirectory);
		    
		      //저장된 파일명 변경하기
	        String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
		    
		}catch(Exception e) {
			e.printStackTrace();
		}
		// $.ajax()쪽으로 업로드된 최종 파일이름을 전송시켜준다.
		response.setContentType("text/html;charset=euc-kr");
		response.getWriter().print(fileName);		
		return null;
	}
}
