package com.jcpdev.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jcpdev.dto.GuguUser;
import com.jcpdev.dto.Mate;
import com.jcpdev.mybatis.SqlSessionBean;

public class GuguMateDao {
	private static GuguMateDao dao = new GuguMateDao();
	private GuguMateDao() {}
	
	public static GuguMateDao getInstance() {
		return dao;
	}
	
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	
	
	public int mateCount(int idx) {
		SqlSession mapper = factory.openSession();
		int count = mapper.selectOne("mate.getlist",idx);
		mapper.close();
		return count;
	}
	

	public List<Mate> matelist(int idx) {
		SqlSession mapper = factory.openSession();
		List<Mate> list = null;
		list = mapper.selectList("mate.matelist", idx);
		mapper.close();
		return list;
	}
	public List<GuguUser> addMate(int idx) {
		SqlSession mapper = factory.openSession();
		List<GuguUser> list = null;
		list = mapper.selectList("mate.metoyou", idx);
		mapper.close();
		return list;
	}
	public List<GuguUser> waitingMate(int idx) {
		SqlSession mapper = factory.openSession();
		List<GuguUser> list = null;
		list = mapper.selectList("mate.youtome", idx);
		mapper.close();
		return list;
	}
	
	public List<GuguUser> randomMate(int idx) {
		SqlSession mapper = factory.openSession();
		List<GuguUser> list = null;
		list = mapper.selectList("mate.random_mate", idx);
		mapper.close();
		return list;
	}
	
	public void myfriend(Mate mate) {
		SqlSession mapper =factory.openSession();
		mapper.update("myfriend", mate);
		mapper.commit();
		mapper.close();
	}
	
	public void yourfriend(Mate mate) {
		SqlSession mapper =factory.openSession();
		mapper.update("yourfriend", mate);
		mapper.commit();
		mapper.close();
	}
	
	public void requestFriend(Mate mate) {
		SqlSession mapper =factory.openSession();
		mapper.insert("request_friend", mate);
		mapper.commit();
		mapper.close();
	}
	
	public void waitingfriend(Mate mate) {
		SqlSession mapper =factory.openSession();
		mapper.insert("waiting_friend", mate);
		mapper.commit();
		mapper.close();
	}
	
	public void mydelete(Map<String, Integer> map) {
		SqlSession mapper =factory.openSession();
		mapper.delete("mydelete", map);
		mapper.commit();
		mapper.close();
	}
	
	public void yourdelete(Map<String, Integer> map) {
		SqlSession mapper =factory.openSession();
		mapper.insert("yourdelete", map);
		mapper.commit();
		mapper.close();
	}
	







}







