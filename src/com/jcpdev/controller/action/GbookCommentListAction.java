package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuestBookDao;
import com.jcpdev.dto.GbookComment;

public class GbookCommentListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		int idx = Integer.parseInt(request.getParameter("idx")); //방명록 고유의 idx
	
		GuestBookDao dao = GuestBookDao.getInstance();
		List<GbookComment> list = dao.getCommentList(idx); //방명록정보
		request.setAttribute("clist", list); 
				
		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.url="view/gbookComment.jsp";
		return forward;
	}

}
