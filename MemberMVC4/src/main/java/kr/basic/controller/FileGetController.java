package kr.basic.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileGetController implements Controller{
	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String filename=request.getParameter("filename");
		System.out.println(filename);		
		
		String UPLOAD_DIR="file_repo";
		String uploadPath=request.getServletContext().getRealPath("")+File.separator+UPLOAD_DIR;
		File f=new File(uploadPath+"\\"+filename);
		// 클라이언트로 부터 넘어오는 파일이름에 한글이 있는경우 깨지지 않게하기 위함
		filename=URLEncoder.encode(filename, "UTF-8");
		filename=filename.replace("+"," ");
		// 다운로드 준비로 서버에서 클라이언트에게 다운로드 준비를 시키는 부분(다운로드 창을 띄운다)
		response.setContentLength((int)f.length());
		response.setContentType("application/x-msdownload;charset=utf-8");
		response.setHeader("Content-Disposition", "attachment;filename="+filename+";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
		// 실제 다운로드를 하는 부분
		FileInputStream in=new FileInputStream(f); //파일읽기 준비
		OutputStream out=response.getOutputStream();
		byte[] buffer=new byte[104];
		while(true) {
			int count=in.read(buffer);
			if(count==-1) {
				break;
			}
			out.write(buffer, 0, count); //다운로드(0%......100%)
		}//_while_
		in.close();
		out.close();		
		return null;
	}
}
