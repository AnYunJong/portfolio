package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuguBoardDao;
import com.jcpdev.dto.BoardComment;

public class BoardCommentInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		//테이블 insert 
		request.setCharacterEncoding("UTF-8");
		int v_idx = Integer.parseInt(request.getParameter("v_idx"));  //홈의 주인의 idx (로그인한 사람 or 친구)
		int u_idx = Integer.parseInt(request.getParameter("u_idx"));// (로그인한 사람 idx) 자기 홈피를 보면 거면v_idx = u_idx
		int idx = Integer.parseInt(request.getParameter("idx")); //게시물 고유의 idx (유니크) 
		String name = request.getParameter("name"); 
		String content = request.getParameter("content"); 
		
		GuguBoardDao dao = GuguBoardDao.getInstance();
		BoardComment dto = new BoardComment();
		dto.setU_idx(u_idx);
		dto.setBoard_idx(idx);
		dto.setName(name);
		dto.setContent(content);
	
		dao.CommentInsert(dto);
		System.out.println("게시물 댓글 입력완료");
			
				

		return new ActionForward(true,"boarddetail.do?u_idx="+u_idx+"&v_idx="+v_idx+"&idx="+idx);
	}
}
