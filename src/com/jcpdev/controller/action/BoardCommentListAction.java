package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuguBoardDao;
import com.jcpdev.dto.BoardComment;

public class BoardCommentListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		

		int idx = Integer.parseInt(request.getParameter("idx")); //게시물 고유의 idx
	
		GuguBoardDao dao = GuguBoardDao.getInstance();
		List<BoardComment> list = dao.getCommentList(idx); //게시물정보
		request.setAttribute("clist", list); 
				
		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.url="view/boardComment.jsp";
		return forward;
	}

}
