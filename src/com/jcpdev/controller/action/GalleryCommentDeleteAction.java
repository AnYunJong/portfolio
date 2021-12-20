package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuguGalleryDao;
import com.jcpdev.dto.GalleryComment;

public class GalleryCommentDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int idx = Integer.parseInt(request.getParameter("idx")); //댓글자체의 idx (유저u_idx와는 다름)
        int u_idx = Integer.parseInt(request.getParameter("u_idx")); //댓글 쓴 사람의 idx
        int gallery_idx = Integer.parseInt(request.getParameter("gallery_idx")); //삭제할때 필요한 정보는 아니지만 다시 댓글 list로 돌아갈떄 필요
        
        GalleryComment dto = new GalleryComment();
        dto.setIdx(idx);
        dto.setU_idx(u_idx);
		
        GuguGalleryDao dao = GuguGalleryDao.getInstance();	
		dao.CommentDelete(dto);
		System.out.println("Gallery Comment Delete 성공");
		
		ActionForward forward = new ActionForward();
		forward.isRedirect = true;
		forward.url="galleryCommentList.do?gallery_idx="+gallery_idx;
		return forward;
	}

}
