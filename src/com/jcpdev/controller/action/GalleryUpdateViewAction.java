package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuguGalleryDao;
import com.jcpdev.dto.GuguGallery;

public class GalleryUpdateViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int idx = Integer.parseInt(request.getParameter("idx")); //사진자체의 idx (유저u_idx와는 다름)
		int v_idx = Integer.parseInt(request.getParameter("v_idx")); //사진자체의 idx (유저u_idx와는 다름)
		System.out.println("select 성공");
	
		GuguGalleryDao dao = GuguGalleryDao.getInstance();	
		GuguGallery dto = dao.getOne(idx);
		
		List<String> category = dao.category(v_idx);
		request.setAttribute("gallery", dto); 
		request.setAttribute("v_idx", v_idx); 
		request.setAttribute("categorylist", category); 
		
		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.url="view/galleryupdate.jsp";		
		return forward;
	}

}
