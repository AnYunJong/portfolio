package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuguUserDao;
import com.jcpdev.dto.TotalProfile;



public class ProfileModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//수정 버튼-> 내용 변경 -> 저장버튼 으로 실행됩니다.
		
		int u_idx = Integer.parseInt(request.getParameter("u_idx"));
		
		GuguUserDao dao = GuguUserDao.getInstance();
		TotalProfile bean = dao.getOne(u_idx);
		request.setAttribute("profile", bean);
		
		String short_intro = dao.getIntro(u_idx); //짧은 소개글 조회
		request.setAttribute("short_intro", short_intro);// 보내기
		String title = dao.getTitle(u_idx); // 타이틀을 조회
		request.setAttribute("title", title );// 보내기
	
		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.url="view/profileupdate.jsp";
		return forward;
	}

}
