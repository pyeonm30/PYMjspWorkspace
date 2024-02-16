package test;

import java.io.File;
import java.io.IOException;


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

	        System.out.println("uploadPath=" + uploadPath);
	        for (Part part : request.getParts()) {
	            String fileName = extractFileName(part);
	            part.write(uploadPath + File.separator + fileName);
	        }
           
	       // response.getWriter().print("Image(s) uploaded successfully!");
	       // request.setAttribute("ctx", request.getContextPath());
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
