package test;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/upload.do")
@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5,
maxRequestSize = 1024 * 1024 * 5 * 5)
public class uploadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String applicationPath = request.getServletContext().getRealPath("");
	        String uploadPath = applicationPath + File.separator + "uploads";
	        
	        File uploadDirectory = new File(uploadPath);
	        if (!uploadDirectory.exists()) {
	            uploadDirectory.mkdir();	
	        }
	        String fileName = "";
	     
	        System.out.println("uploadPath=" + uploadPath);
	        MyFile file = null;
	        for (Part part : request.getParts()) {
	            fileName = extractFileName(part);
	            if(!("".equals(fileName))) {
	            	Path uploadedFilePath = Paths.get(uploadPath, fileName);
	            	
	            	file = new MyFile();
	                if (Files.exists(uploadedFilePath)) {
	                	
	                	file.setOfileName(fileName);
	                    String timestamp = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
	                    String[] fileNameParts = fileName.split("\\.");
	                    fileName = fileNameParts[0] + "_" + timestamp + "." + fileNameParts[1];
	                    uploadedFilePath = Paths.get(uploadPath, fileName);
	                    System.out.println("test = " + uploadedFilePath.toString());
	                   
	                }else {
	                	file.setOfileName(fileName);
	                }
	            	
	                try (InputStream input = part.getInputStream()) {
	                    Files.copy(input, uploadedFilePath, StandardCopyOption.REPLACE_EXISTING);

	                    file.setSfileName(fileName);
	                    file.setFileSize((int) Math.ceil(part.getSize() / 1024.0));

	                    System.out.println("file = " + file);
	                } catch (IOException e) {
	                    System.out.println("Fail : " + e.getMessage());
	                }
	            }
	        }
           

	        request.setAttribute("file", file);
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp"); 
			rd.forward(request, response);
			
			
			
	    }

	    private String extractFileName(Part part) {
	        String contentDisp = part.getHeader("content-disposition");
	        String[] items = contentDisp.split(";");
	        for (String s : items) {
	            if (s.trim().startsWith("filename")) {
	            	System.out.println("s= " + s);
	            	s=  s.substring(s.indexOf("=") + 2, s.length() - 1);
	            	System.out.println("s= " + s);
	                return s;
	            }
	            
	        }
	        
	        
	        
	        
	        return "";
	    }

}
