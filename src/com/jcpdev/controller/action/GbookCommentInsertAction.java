package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuestBookDao;
import com.jcpdev.dto.GbookComment;

public class GbookCommentInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//테이블 insert 
		request.setCharacterEncoding("UTF-8");
		int v_idx = Integer.parseInt(request.getParameter("v_idx"));  //홈의 주인의 idx (로그인한 사람 or 친구)
		int u_idx = Integer.parseInt(request.getParameter("u_idx"));// (로그인한 사람 idx) 자기 홈피를 보면 거면v_idx = u_idx
		int idx = Integer.parseInt(request.getParameter("idx")); //방명록 고유의 idx (유니크) 
		String name = request.getParameter("name"); 
		String content = request.getParameter("content"); 
		
		GuestBookDao dao = GuestBookDao.getInstance();
		GbookComment dto = new GbookComment();
		dto.setU_idx(u_idx);
		dto.setBook_idx(idx);
		dto.setName(name);
		dto.setContent(content);
	
		dao.CommentInsert(dto);
		System.out.println("방명록 댓글 입력완료");
			
				

		return new ActionForward(true,"guestbook.do?u_idx="+u_idx+"&v_idx="+v_idx);
	}
}
