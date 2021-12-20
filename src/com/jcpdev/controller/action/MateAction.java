package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.jcpdev.dao.GuguMateDao;
import com.jcpdev.dao.GuguUserDao;
import com.jcpdev.dto.GuguUser;
import com.jcpdev.dto.Mate;
import com.jcpdev.dto.TotalProfile;

public class MateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int mate_idx = Integer.parseInt(request.getParameter("v_idx"));
		
		GuguMateDao mdao = GuguMateDao.getInstance();
		List<Mate> matelist =mdao.matelist(mate_idx);
		List<GuguUser> addmate =mdao.addMate(mate_idx);
		List<GuguUser> waitingmate =mdao.waitingMate(mate_idx);
		List<GuguUser> randommate =mdao.randomMate(mate_idx);
		
		request.setAttribute("v_idx", mate_idx);
		
		request.setAttribute("matelist", matelist);
		request.setAttribute("addmate", addmate);
		request.setAttribute("waitingmate", waitingmate);
		request.setAttribute("randommate", randommate);
		
		GuguUserDao udao = GuguUserDao.getInstance();
		String short_intro = udao.getIntro(mate_idx); //짧은 소개글 조회
		request.setAttribute("short_intro", short_intro);// 보내기
		String title = udao.getTitle(mate_idx); // 타이틀을 조회
		request.setAttribute("title", title );// 보내기

		String name = udao.getName(mate_idx);
		request.setAttribute("name", name);
		TotalProfile bean = udao.getOne(mate_idx);
		request.setAttribute("profile", bean);
		
		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.url = "view/mate.jsp";
		
		return forward;
	}

}
