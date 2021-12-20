package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuestBookDao;
import com.jcpdev.dao.GuguMateDao;
import com.jcpdev.dto.GuestBook;
import com.jcpdev.dto.Mate;

public class GuestBookSaveAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		int u_idx = Integer.parseInt(request.getParameter("u_idx"));
		int v_idx = Integer.parseInt(request.getParameter("v_idx"));
		String name = request.getParameter("u_name");
		String content = request.getParameter("content");
		
		GuestBook dto = new GuestBook();
		dto.setU_idx(u_idx);
		dto.setV_idx(v_idx);
		dto.setName(name);
		dto.setContent(content);
		
		GuestBookDao dao = GuestBookDao.getInstance();
		dao.insert(dto);
		
		ActionForward forward = new ActionForward();
		forward.isRedirect = true;
		forward.url ="guestbook.do?u_idx="+u_idx+"&v_idx="+v_idx;
		
		return forward;
	}

}
