package com.rentcar.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.rentcar.util.MybatisConfig;
import com.rentcar.vo.JoinCarView;
import com.rentcar.vo.Rentcar;
import com.rentcar.vo.Reservation;



public class RentCarDAO {
	private RentCarDAO() {
	}

	private static RentCarDAO dao = new RentCarDAO();
 
	public static RentCarDAO getInstance() {
		return dao;
	}
    public List<Rentcar> getAllCarlist() {
		   SqlSession session= MybatisConfig.getInstance().openSession(true);
		   List<Rentcar> list = session.selectList("mapper.rentcar.getAllRentcar");
		   session.close();
		   return list;
 }
    public List<Rentcar> getRecentCarlist() {
		   SqlSession session= MybatisConfig.getInstance().openSession(true);
		   List<Rentcar> list = session.selectList("mapper.rentcar.getRecentCarList");
		   session.close();
		   return list;
}
    public List<Rentcar> getCategoryCarlist(int categroy) {
		   SqlSession session= MybatisConfig.getInstance().openSession(true);
		   List<Rentcar> list = session.selectList("mapper.rentcar.getKindCarList",categroy);
		   session.close();
		   return list;
}
    public Rentcar getOneCar(int num) {
		   SqlSession session= MybatisConfig.getInstance().openSession(true);
		   Rentcar car = session.selectOne("mapper.rentcar.getOneRentCar", num);
		   session.close();
		   return car;
}
    
    public int insertRentcar(Rentcar vo) {
		   SqlSession session= MybatisConfig.getInstance().openSession(true);
		   int cnt = session.insert("mapper.rentcar.insertRentcar",vo);
		   session.commit();
		   session.close();
		   return cnt;
}
    
    public int addTotalQty(Reservation vo) {
		   SqlSession session= MybatisConfig.getInstance().openSession(true);
		   int cnt = session.insert("mapper.rentcar.addTotalQty",vo);
		   session.commit();
		   session.close();	   
		   return cnt;
}
    public int reduceTotalQty(Reservation vo) {
		   SqlSession session= MybatisConfig.getInstance().openSession(true);
		   int cnt = session.insert("mapper.rentcar.reduceTotalQty",vo);
		   session.commit();
		   session.close();
		   return cnt;
}
	
	
}
