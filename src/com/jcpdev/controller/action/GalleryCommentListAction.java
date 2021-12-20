package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuguGalleryDao;
import com.jcpdev.dao.GuguUserDao;
import com.jcpdev.dto.GalleryComment;
import com.jcpdev.dto.GuguGallery;
import com.jcpdev.dto.TotalProfile;

public class GalleryCommentListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int gallery_idx = Integer.parseInt(request.getParameter("gallery_idx")); //사진 고유의 idx
	
		GuguGalleryDao gdao = GuguGalleryDao.getInstance();		
		List<GalleryComment> list = gdao.getCommentList(gallery_idx); //사진정보
		request.setAttribute("clist", list); 
				
		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.url="view/galleryComment.jsp";
		return forward;
	}

}
