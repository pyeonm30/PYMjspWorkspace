package kr.basic.utils;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class FileUtil {
	//파일 업로드
	public static String uploadFile(HttpServletRequest req, String sDirectory) 
			throws ServletException, IOException {
		//Part 객체를 통해 서버로 전송된 파일명 읽어오기 
		 Part part = req.getPart("ofile");				
		 
		//Part 객체의 헤더값 중 content-disposition 읽어오기 
        String partHeader = part.getHeader("content-disposition");
        //출력결과 => form-data; name="attachedFile"; filename="파일명.jpg"
        System.out.println("partHeader="+ partHeader);
         
        //헤더값에서 파일명 잘라내기
        String[] phArr = partHeader.split("filename=");
        System.out.println(Arrays.toString(phArr));
        
        String originalFileName = phArr[1].trim().replace("\"", "");
        System.out.println("originalFileName="+ originalFileName);
		
        //폴더 없으면 생성하기 
        createDirectoryIfNotExists(sDirectory);
        
        
		// 파일이름이 있다면 
        if (!originalFileName.isEmpty()) {
        	 Path targetPath = Paths.get(sDirectory, originalFileName);
             try {
                 Files.createFile(targetPath);
             } catch (IOException e) {
                 e.printStackTrace();
             }
        }
		 
		//원본 파일명 반환
		return originalFileName;			
	}
	
	// 폴더 없으면 폴더 생성 
	private static void createDirectoryIfNotExists(String directory) {

	    Path dirPath = Paths.get(directory);
	    if (Files.notExists(dirPath)) {
	        try {
	            Files.createDirectories(dirPath);
	        } catch (IOException e) {
	            e.printStackTrace();
	         
	        }
	    }
	}
	
	//파일명 변경
	public static String renameFile(String sDirectory, String fileName) {
		//원본파일의 확장자 잘라내기
		String ext = fileName.substring(fileName.lastIndexOf("."));
		//날짜 및 시간을 통해 파일명 생성
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(LocalDateTime.now());
		//"날짜_시간.확장자" 형태의 새로운 파일명 생성
		String newFileName = now + ext;  
		
		   
		   Path sourcePath = Paths.get(sDirectory, fileName);
	        Path targetPath = Paths.get(sDirectory, newFileName);

	        try {
	            Files.move(sourcePath, targetPath, StandardCopyOption.REPLACE_EXISTING);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    //변경된 파일명 반환
	    return newFileName;
	}
}
