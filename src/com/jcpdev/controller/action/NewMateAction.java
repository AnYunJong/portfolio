package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuguMateDao;
import com.jcpdev.dto.Mate;

public class NewMateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		int u_idx = Integer.parseInt(request.getParameter("u_idx"));
		int v_idx = Integer.parseInt(request.getParameter("v_idx"));
		String nickname = request.getParameter("nickname");
		
		Mate mate = new Mate();
		
		System.out.println(nickname);
		
		mate.setNickName(nickname);
		mate.setV_idx(v_idx);
		mate.setU_idx(u_idx);
		
		GuguMateDao dao = GuguMateDao.getInstance();
		dao.myfriend(mate);
		dao.yourfriend(mate);
		
		ActionForward forward = new ActionForward();
		forward.isRedirect = true;
		forward.url ="mateAction.do?u_idx="+u_idx+"&v_idx="+u_idx;
		
		
		return forward;
	}

}
