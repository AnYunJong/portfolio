package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuguBoardDao;
import com.jcpdev.dto.GuguBoard;

public class GuguBoardSave implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		int u_idx = Integer.parseInt(request.getParameter("u_idx"));
		int v_idx = Integer.parseInt(request.getParameter("v_idx"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		GuguBoard dto = new GuguBoard();
		dto.setU_idx(u_idx);
		dto.setSubject(subject);
		dto.setContent(content);
		
		GuguBoardDao dao = GuguBoardDao.getInstance();
		dao.boardInput(dto);
		
		ActionForward forward = new ActionForward();
		forward.isRedirect=true;
		forward.url="guguboard.do?u_idx="+u_idx+"&v_idx="+v_idx;
		
		return forward;
	}

}
