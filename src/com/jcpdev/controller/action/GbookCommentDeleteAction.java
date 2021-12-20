package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuestBookDao;
import com.jcpdev.dto.GbookComment;

public class GbookCommentDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx")); //댓글 자체의 idx
        int u_idx = Integer.parseInt(request.getParameter("u_idx")); // 댓글 남긴 사람의 idx
        int book_idx = Integer.parseInt(request.getParameter("book_idx")); // 방명록의 idx 

        GbookComment dto = new GbookComment();
        dto.setIdx(idx);
        dto.setU_idx(u_idx);
		
		GuestBookDao dao = GuestBookDao.getInstance();
        dao.CommentDelete(dto);
		System.out.println("Gbook Comment Delete 성공");
		
		ActionForward forward = new ActionForward();
		forward.isRedirect = true;
		forward.url="gbookCommentList.do?idx="+book_idx;
		return forward;
	}

}
