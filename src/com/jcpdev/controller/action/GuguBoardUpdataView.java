package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuguBoardDao;
import com.jcpdev.dto.GuguBoard;

public class GuguBoardUpdataView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		GuguBoardDao dao = GuguBoardDao.getInstance();
		
		int v_idx = Integer.parseInt(request.getParameter("v_idx"));
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		
		GuguBoard dto =  dao.getOne(idx);
		request.setAttribute("board", dto);
		request.setAttribute("v_idx", v_idx);
		
		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		foward.url="view/boardupdate.jsp";
		return foward;
	}

}