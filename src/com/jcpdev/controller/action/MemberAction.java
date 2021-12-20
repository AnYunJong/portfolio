package com.jcpdev.controller.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuguGalleryDao;
import com.jcpdev.dao.GuguUserDao;
import com.jcpdev.dto.GuguUser;

public class MemberAction implements Action {

	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws javax.servlet.ServletException ,java.io.IOException {

		//테이블 insert 
		request.setCharacterEncoding("UTF-8");

		String name = request.getParameter("name"); 
		String email = request.getParameter("email"); 
		String password = request.getParameter("password"); 
		int birth = Integer.parseInt(request.getParameter("birth")); 
		String gender = request.getParameter("gender"); 
		String phone_number = request.getParameter("phone_number");

		GuguUser dto = new GuguUser();
		dto.setName(name);
		dto.setEmail(email);
		dto.setPassword(password);
		dto.setBirth(birth);
		dto.setGender(gender);
		dto.setPhone_number(phone_number);
		GuguUserDao dao = GuguUserDao.getInstance();
		
		int idx = dao.insert(dto);
		GuguGalleryDao gdao = GuguGalleryDao.getInstance();
		List<String> category = gdao.category(idx);
		if(category.size()==0)
			gdao.setting(idx);
		
		
		ActionForward forward = new ActionForward();
		forward.isRedirect = true;
		forward.url = "login.do";
		return forward;

		

	}
}