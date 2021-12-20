package com.jcpdev.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jcpdev.dto.GuguHome;
import com.jcpdev.mybatis.SqlSessionBean;

public class GuguHomeDao {
	private static GuguHomeDao dao = new GuguHomeDao();
	private GuguHomeDao() {
		// TODO Auto-generated constructor stub
	}
	public static GuguHomeDao getInstance() {
		return dao;
	}
	
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();	
	
	public GuguHome userhome(int idx) {
		GuguHome dto = null;
		SqlSession mapper = factory.openSession();
		dto = mapper.selectOne("home.userhome",idx);
		mapper.close();
		return dto;
	}
	
	public void updateCount(int idx) {
		SqlSession mapper = factory.openSession();
		mapper.update("updatecount", idx);
		mapper.commit();
		mapper.close();
	}
	
	public void insert(GuguHome guguhome) {
		SqlSession mapper = factory.openSession();
		mapper.insert("home.insert", guguhome);
		mapper.commit();
		mapper.close();
	}
}
