package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.GuguUserDao;
import com.jcpdev.dto.GuguUser;
import com.jcpdev.dto.SessionDto;
import com.jcpdev.dto.TotalProfile;


public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		HttpSession session = request.getSession();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		if(session.getAttribute("readIdx") ==null){
			StringBuilder readIdx=new StringBuilder("/");
			session.setAttribute("readIdx", readIdx);
		}
		
		Map<String,String> map = new HashMap<>();
		map.put("email",email);
		map.put("password",password);

		// db 테이블 select 쿼리 실행	
		GuguUserDao dao = GuguUserDao.getInstance();
		SessionDto user = dao.login(map);
		
		if(user != null){	//로그인 정보 일치
			session.setAttribute("user", user);
			request.setAttribute("message", "로그인 되었습니다.");
			request.setAttribute("url", "home.do");
		}else {				//로그인 정보 불일치
			request.setAttribute("message", "로그인 정보가 올바르지 않습니다.");
			request.setAttribute("url", "login.do");   //변경
		}
		
		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		foward.url="error/alert.jsp";
		return foward;
	}
}