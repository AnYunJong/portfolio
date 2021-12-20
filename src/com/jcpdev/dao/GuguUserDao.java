package com.jcpdev.dao;


import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jcpdev.dto.GuguUser;
import com.jcpdev.dto.SessionDto;
import com.jcpdev.dto.TotalProfile;
import com.jcpdev.mybatis.SqlSessionBean;

public class GuguUserDao {
	
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	private static GuguUserDao dao = new GuguUserDao();
	
	private GuguUserDao() { }
	public static GuguUserDao getInstance() {
		return dao;
	}
	
	//회원가입 필수 컬럼만 인서트
	public int insert(GuguUser dto) {
		SqlSession mapper = factory.openSession();
		mapper.insert("guguUser.insert", dto);    
		mapper.commit();
		mapper.close();
		return dto.getIdx();
	}
	
	//로그인 정보 일치하는지
	public SessionDto login(Map<String, String> map) {
		SessionDto dto = null;
		SqlSession mapper= factory.openSession();
		dto = mapper.selectOne("guguUser.loginCheck", map);
		mapper.close();
		return dto;
	}
	
	// 비번 찾기
	public String lookForPW(Map<String, String> map) {
		String password = null;
		SqlSession mapper= factory.openSession();
		password = mapper.selectOne("guguUser.lookForPW",map);
		mapper.close();
		return password;
	}
	
	//email 찾기
	public String lookForEmail(Map<String, String> map) {
		String email = null;
		SqlSession mapper= factory.openSession();
		email = mapper.selectOne("guguUser.lookForEmail",map);
		mapper.close();
		return email;
	}
	
	//idx로 개인의 총 정보 프로필 조회
	public TotalProfile getOne(int idx) {
		SqlSession mapper = factory.openSession();
		TotalProfile dto = mapper.selectOne("guguUser.selectByIdx", idx);  
		mapper.close();
		return dto;
	}
	
	//프로필 수정 업데이트
	public void update(GuguUser dto) {
		SqlSession mapper = factory.openSession();
		mapper.update("guguUser.update",dto);
		mapper.commit();
		mapper.close();		
	}
	
	//[민재]
	//이름만 불러오기
	public String getName(int idx) {
		SqlSession mapper = factory.openSession();
		String name = mapper.selectOne("getname",idx);
		mapper.close();
		return name;
	}
	
	//짧은 소개글 업데이트
	public void short_update(GuguUser dto) { 
		SqlSession mapper = factory.openSession();
		mapper.update("guguUser.short_introUpdate",dto);
		mapper.commit();
		mapper.close();		
	}
	//title 업데이트
	public void title_update(GuguUser dto) { 
		SqlSession mapper = factory.openSession();
		mapper.update("guguUser.titleUpdate",dto);
		mapper.commit();
		mapper.close();		
	}
	
	//idx로 개인의 짧은 소개글과 조회
	public String getIntro(int idx) {
		SqlSession mapper = factory.openSession();
		String short_info = mapper.selectOne("guguUser.selectIntro", idx);  
		mapper.close();
		return short_info;
	}
	
	//idx로 홈의 title 조회
	public String getTitle(int idx) {
		SqlSession mapper = factory.openSession();
		String home_title = mapper.selectOne("guguUser.selectTitle", idx);  
		mapper.close();
		return home_title;
	}
	
}
