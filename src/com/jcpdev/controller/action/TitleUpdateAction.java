package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuguBoardDao;
import com.jcpdev.dao.GuguUserDao;
import com.jcpdev.dto.BoardComment;
import com.jcpdev.dto.GuguUser;

public class TitleUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//테이블  update 
		request.setCharacterEncoding("UTF-8");
		int v_idx = Integer.parseInt(request.getParameter("v_idx"));  
		int u_idx = Integer.parseInt(request.getParameter("u_idx"));
		String short_intro= request.getParameter("short_intro"); 
		String title = request.getParameter("title"); 
		
		GuguUser dto = new GuguUser();
		dto.setIdx(u_idx);
		dto.setShort_intro(short_intro);
		dto.setTitle(title);
		
		GuguUserDao dao = GuguUserDao.getInstance();
		dao.title_update(dto);
		System.out.println(" title 업데이트완료");
			
				

		return new ActionForward(true,"minihome.do?u_idx="+u_idx+"&v_idx="+v_idx);
	}
}
