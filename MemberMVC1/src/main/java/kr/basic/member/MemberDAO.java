package kr.basic.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {

	private MemberDAO() {}
	
	static private MemberDAO instance;
	static public MemberDAO getInstance() {
		if(instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}
	private Connection conn; // db 객체
	private PreparedStatement ps; // 쿼리문 객체 
	private ResultSet rs; // 뷰테이블 객체 
	
	// 데이터베이스 연동하기 => conncection 객체 생성 
	private void getConnect() {
		String url = "jdbc:mysql://localhost:3306/testdb?charaterEncoding=UTF-8&serverTimezone=UTC";
		String user ="root";
		String password="1234";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			System.out.println(conn);
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("연동실패");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("driver 클래스 찾지 못함 ");
		}
	}
	
	public ArrayList<Member> getMemberList(){
		ArrayList<Member> list = new ArrayList<Member>();
		String sql = "select * from member";
		try {
			getConnect();
			ps = conn.prepareStatement(sql); // string 값을 sql 명령문으로 만드는 객체
			rs = ps.executeQuery(); // 명령문을 실행 후 뷰테이블을 담은 객체
			
			// rs.next() 테이블에 레코드(row) 가 있다면 true : 한줄씩 체크한다 
			// 몇줄 있는지 모르니깐 while 담기 
			while(rs.next()) {
				int num =rs.getInt("num");
				String id = rs.getString("id");
				String pass = rs.getString("pass");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				
				Member m = new Member(num,id,pass,name,age,email,phone);
				list.add(m);
				System.out.println(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
}
