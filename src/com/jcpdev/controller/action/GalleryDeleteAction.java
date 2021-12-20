package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuguGalleryDao;

public class GalleryDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int idx = Integer.parseInt(request.getParameter("idx")); //사진자체의 idx (유저u_idx와는 다름)
        int u_idx = Integer.parseInt(request.getParameter("u_idx")); 
        int v_idx = Integer.parseInt(request.getParameter("v_idx")); 

		GuguGalleryDao dao = GuguGalleryDao.getInstance();	
		dao.delete(idx);
		System.out.println("delete 성공");
		
		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.url="gallery.do?u_idx="+u_idx+"&v_idx="+v_idx;
		return forward;
	}

}
