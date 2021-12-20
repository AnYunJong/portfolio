package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuguGalleryDao;
import com.jcpdev.dto.GalleryCategory;

public class GalleryCategoryAdd implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		GuguGalleryDao gdao = GuguGalleryDao.getInstance();
			request.setCharacterEncoding("UTF-8");
	         int u_idx = Integer.parseInt(request.getParameter("u_idx")); 
	         String category = request.getParameter("categoryname");
			 //int heart = Integer.parseInt(multi_request.getParameter("heart"));   
	         
	         GalleryCategory vo = new GalleryCategory();
	         vo.setU_idx(u_idx);
	         vo.setCategory(category);
	         //vo.setHeart(heart);
	         gdao.categoryadd(vo); 
	         System.out.println("category add 성공!");
		return new ActionForward(true,"gallery.do?u_idx="+u_idx+"&v_idx="+u_idx);
	}
	
}
