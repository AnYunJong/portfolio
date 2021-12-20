package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.GuguUserDao;
import com.jcpdev.dto.SessionDto;


public class LookForEmailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); //한글깨짐 방지
		
		HttpSession session = request.getSession();
		String name = request.getParameter("name");
		String phone_number = request.getParameter("phone_number");
		
		if(session.getAttribute("readIdx") ==null){
			StringBuilder readIdx=new StringBuilder("/");
			session.setAttribute("readIdx", readIdx);
		}
		
		Map<String,String> map = new HashMap<>();
		map.put("name",name);
		map.put("phone_number",phone_number);

		// db 테이블 select 쿼리 실행	
		GuguUserDao dao = GuguUserDao.getInstance();
		String email = dao.lookForEmail(map);  //dao.lookForPW 결과로 password를 찾을수 있다
	
		if(email != null){	//회원 정보 일치
			request.setAttribute("message", "회원가입된 email은 "+email+"입니다");
			request.setAttribute("url", "login.do");
		}else {				//회원 정보 불일치
			request.setAttribute("message", "회원이 아니십니다. 회원가입 하시겠습니까?");
			request.setAttribute("url", "member.do");   //변경
		}
		
		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		foward.url="error/alert.jsp";
		return foward;
	}
}