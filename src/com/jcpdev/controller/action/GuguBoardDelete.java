package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.GuguBoardDao;
import com.jcpdev.dto.GuguBoard;
import com.jcpdev.dto.SessionDto;

public class GuguBoardDelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
		int u_idx = Integer.parseInt(request.getParameter("u_idx"));
		int v_idx = Integer.parseInt(request.getParameter("v_idx"));
		
		GuguBoardDao dao = GuguBoardDao.getInstance();
		dao.delete(idx);
		
		ActionForward forward = new ActionForward();
		forward.isRedirect=true;
		forward.url="guguboard.do?u_idx="+u_idx+"&v_idx="+v_idx;
		
		return forward;
	}

}
