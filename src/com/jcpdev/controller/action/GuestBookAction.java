package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuestBookDao;
import com.jcpdev.dao.GuguUserDao;
import com.jcpdev.dto.GuestBook;

public class GuestBookAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int v_idx = Integer.parseInt(request.getParameter("v_idx"));
		
		List<GuestBook> list =null;
		
		GuestBookDao dao = GuestBookDao.getInstance();
		list = dao.getList(v_idx);
		
		request.setAttribute("list", list);
		request.setAttribute("v_idx", v_idx);
		
		GuguUserDao udao = GuguUserDao.getInstance();
		String name = udao.getName(v_idx);
		request.setAttribute("name", name);
		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.url="view/guestbook.jsp";
		
		
		return forward;
	}

}
