package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuguBoardDao;
import com.jcpdev.dto.BoardComment;

public class BoardCommentDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int idx = Integer.parseInt(request.getParameter("idx"));  //댓글 자제의 idx
        int u_idx = Integer.parseInt(request.getParameter("u_idx")); //남긴 사진의 idx
        int board_idx = Integer.parseInt(request.getParameter("board_idx")); //게시물 자체의 idx
       

        BoardComment dto = new BoardComment();
        dto.setIdx(idx);
        dto.setU_idx(u_idx);
		
		GuguBoardDao dao = GuguBoardDao.getInstance();
        dao.CommentDelete(dto);
		System.out.println("Board Comment Delete 성공");
		
		ActionForward forward = new ActionForward();
		forward.isRedirect = true;
		forward.url="boardCommentList.do?idx="+board_idx;
		return forward;
	}

}
