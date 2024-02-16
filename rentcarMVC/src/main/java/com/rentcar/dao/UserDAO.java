package com.rentcar.dao;

import org.apache.ibatis.session.SqlSession;

import com.rentcar.util.MybatisConfig;
import com.rentcar.vo.User;

public class UserDAO {
	private UserDAO() {
	}

	private static UserDAO dao = new UserDAO();
 
	public static UserDAO getInstance() {
		return dao;
	}

	   // 회원로그인
	   public String userLogin(User user) {
		   SqlSession session= MybatisConfig.getInstance().openSession(true);
		   String userId=session.selectOne("mapper.user.userLogin", user);
		   session.close();
		   return userId;
	   }
	   
	   public String checkValidId(String id) {
		   SqlSession session= MybatisConfig.getInstance().openSession(true);
		   String userId=session.selectOne("mapper.user.validId", id);
		   session.close();
		   return userId;
	   }
	      
	   public int addUser(User user) {
		   SqlSession session= MybatisConfig.getInstance().openSession(true);
		   int cnt=session.insert("mapper.user.userInsert", user);
		   session.close();
		   return cnt;
	   }
	   
	   public User getOneUser(String id) {
		   SqlSession session= MybatisConfig.getInstance().openSession(true);
		   User user = session.selectOne("mapper.user.getOneUser",id);
		   session.close();
		   return user;
	   }

	   
	   public int userUpdate(User user) {
		   SqlSession session= MybatisConfig.getInstance().openSession(true);
		   int cnt= session.update("mapper.user.userUpdate",user);
		   session.close();
		   return cnt;
	   }
	   
	   public int removeUser(String id) {
		   SqlSession session= MybatisConfig.getInstance().openSession(true);
		   int cnt=session.insert("mapper.user.userDelete", id);
		   session.close();
		   return cnt;
	   }
}

