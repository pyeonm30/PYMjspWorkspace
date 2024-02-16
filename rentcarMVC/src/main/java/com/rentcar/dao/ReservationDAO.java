package com.rentcar.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.rentcar.util.MybatisConfig;
import com.rentcar.vo.JoinCarView;
import com.rentcar.vo.Rentcar;
import com.rentcar.vo.Reservation;



public class ReservationDAO {
	private ReservationDAO() {
	}

	private static ReservationDAO dao = new ReservationDAO();
 
	public static ReservationDAO getInstance() {
		return dao;
	}
    public int addReservation(Reservation vo) {
		   SqlSession session= MybatisConfig.getInstance().openSession(true);
		   int cnt = session.insert("mapper.reservation.reservationInsert",vo);
		   session.close();
		   return cnt;
 }
    
    public List<Rentcar> getUserRevList(String userid) {
		   SqlSession session= MybatisConfig.getInstance().openSession(true);
		   List<Rentcar> list = session.selectList("mapper.reservation.getUserReserveList",userid);
		   session.close();
		   return list;
}
    
    public int deleteAReservation(int reserve_seq) {
		   SqlSession session= MybatisConfig.getInstance().openSession(true);
		   int cnt = session.delete("mapper.reservation.reservationDelete",reserve_seq);
		   session.close();
		   return cnt;
}
    public List<JoinCarView> getJoinCarView(String id) {
 	   SqlSession session= MybatisConfig.getInstance().openSession(true);
 	   List<JoinCarView> list = session.selectList("mapper.reservation.getJoinCarView", id);
		   session.close();
		   return list;
 }
    
    public Reservation getOneReservation(int reserveSeq) {
		   SqlSession session= MybatisConfig.getInstance().openSession(true);
		   Reservation book = session.selectOne("mapper.reservation.getOneReservation",reserveSeq);
		   session.close();
		   return book;
}

    
}
