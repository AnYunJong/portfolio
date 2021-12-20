package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuguUserDao;
import com.jcpdev.dto.TotalProfile;

public class NewFriendAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int u_idx = Integer.parseInt(request.getParameter("u_idx"));
		int v_idx = Integer.parseInt(request.getParameter("v_idx"));

		GuguUserDao dao = GuguUserDao.getInstance();
		
		String v_name = dao.getName(v_idx);
		
		request.setAttribute("u_idx", u_idx);
		request.setAttribute("v_idx", v_idx);
		request.setAttribute("v_name", v_name);
		
		String short_intro = dao.getIntro(v_idx); //짧은 소개글 조회
		request.setAttribute("short_intro", short_intro);// 보내기
		String title = dao.getTitle(v_idx); // 타이틀을 조회
		request.setAttribute("title", title );// 보내기
		TotalProfile bean = dao.getOne(v_idx);
		request.setAttribute("profile", bean);
		
		ActionForward forward = new ActionForward();
		forward.isRedirect =false;
		forward.url ="view/mateaccept.jsp";
		
		return forward;
	}

}
