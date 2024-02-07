package kr.basic.model;

import java.sql.*;
import java.util.ArrayList;
public class MemberDAO {
	
	private MemberDAO() {}
	
	static private MemberDAO instance = new MemberDAO();
	static public MemberDAO getInstance() {
		return instance;
	}
		
	
private Connection conn;
private PreparedStatement ps;
private ResultSet rs;

public void getConnect() {
	   String URL="jdbc:mysql://localhost:3306/testdb?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	   String user="root";
	   String password="1234";
	  try {

		  Class.forName("com.mysql.cj.jdbc.Driver");		  
		  conn=DriverManager.getConnection(URL, user, password);
		  System.out.println("db 연동성공: " + conn );
	   } catch (Exception e) {
		  e.printStackTrace();
	  }		   
}   

public int memberInsert(MemberVO vo) {

	  String SQL="insert into member(id, pass, name, age, email, phone) values(?,?,?,?,?,?)"; 
	  getConnect();

	  int cnt=-1;
	  try {
		ps=conn.prepareStatement(SQL); 
		ps.setString(1, vo.getId());
		ps.setString(2, vo.getPass());
		ps.setString(3, vo.getName());
		ps.setInt(4, vo.getAge());
		ps.setString(5, vo.getEmail());
		ps.setString(6, vo.getPhone());
		cnt=ps.executeUpdate(); 
		
	   }catch (Exception e) {
		e.printStackTrace();
	   }finally {
		   dbClose();
	  }
	  return cnt; 
}

public ArrayList<MemberVO> memberList() {
	 String SQL="select * from member";
	 getConnect();
	 ArrayList<MemberVO> list=new ArrayList<MemberVO>();
	 try {
	   ps=conn.prepareStatement(SQL);
	   rs=ps.executeQuery();
	   while(rs.next()) {
		   int num=rs.getInt("num");
		   String id=rs.getString("id");
		   String pass=rs.getString("pass");
		   String name=rs.getString("name");		   
		   int age=rs.getInt("age");
		   String email=rs.getString("email");
		   String phone=rs.getString("phone");
	
		   MemberVO vo=new MemberVO(num, id, pass, name, age, email, phone);
		   list.add(vo);		   
	   }
	 } catch (Exception e) {
    e.printStackTrace();
	 }finally {
		dbClose();
	 }	 
	 return list;
}


public boolean isValidId(String id) {
	 String SQL="select pass from member where id=?";
	 getConnect();

	 try {
	   ps=conn.prepareStatement(SQL);
	   ps.setString(1, id);
	   rs=ps.executeQuery();
	   return rs.next();
	 } catch (Exception e) {
		e.printStackTrace();
	 }finally {
		dbClose();
	}	   
	 return false;
}

public boolean checkLogin(String id , String pw) {
	 String SQL="select * from member where id=? and pw=?";
	 getConnect();
	 try {
	   ps=conn.prepareStatement(SQL);
	   ps.setString(1, id);
	   ps.setString(2, pw);
	  rs=ps.executeQuery();
	  return rs.next();
		
	 } catch (Exception e) {
		e.printStackTrace();
	 }finally {
		dbClose();
	}	   
	 return false;
}


public int getMemberNo(String id) {
	 String SQL="select num from member where id=?";
	 getConnect();

	 try {
	   ps=conn.prepareStatement(SQL);
	   ps.setString(1, id);
		rs=ps.executeQuery();
		 if(rs.next()) {
			 return rs.getInt("num");
		 }
	 } catch (Exception e) {
		e.printStackTrace();
	 }finally {
		dbClose();
	}	   
	 return -1;
}



public int memberDelete(String id) {
	 String SQL="delete from member where id=?";
	 getConnect();
	 int cnt=-1;
	 try {
	   ps=conn.prepareStatement(SQL);
	   ps.setString(1,id);
	   cnt=ps.executeUpdate(); 
	 } catch (Exception e) {
		e.printStackTrace();
	 }finally {
		dbClose();
	}	   
	 return cnt;
}


public MemberVO memberContent(int num) {
	   String SQL="select * from member where num=?";
	   getConnect();
	   MemberVO vo=null;
	   try {
		 ps=conn.prepareStatement(SQL);
		  ps.setInt(1,num);
		 rs=ps.executeQuery();
		 if(rs.next()) {
			   String id=rs.getString("id");
			   String pass=rs.getString("pass");
			   String name=rs.getString("name");		   
			   int age=rs.getInt("age");
			   String email=rs.getString("email");
			   String phone=rs.getString("phone");
			   vo=new MemberVO(num, id, pass, name, age, email, phone);
		 }
	   } catch (Exception e) {
		 e.printStackTrace();
	   }finally {
		  dbClose();
	   }	
	   return vo;
}
public int memberUpdate(MemberVO vo) {
	   String SQL="update member set age=?, email=?, phone=? where num=?";
	   getConnect();
	   int cnt=-1;
	   try {
	   	ps=conn.prepareStatement(SQL);
	   	ps.setInt(1, vo.getAge());
	   	ps.setString(2, vo.getEmail());
	   	ps.setString(3, vo.getPhone());
	   	ps.setInt(4, vo.getNum());	   	
	   	cnt=ps.executeUpdate();	   	
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		dbClose();
	}	   
	   return cnt;
}
public void dbClose() {
	  try { 
	   if(rs!=null) rs.close();
	   if(ps!=null) ps.close();
	   if(conn!=null) conn.close();
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
}   
}
