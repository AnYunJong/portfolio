package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuguGalleryDao;
import com.jcpdev.dto.GuguGallery;

public class GalleryUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		GuguGalleryDao gdao = GuguGalleryDao.getInstance();
			request.setCharacterEncoding("UTF-8");
	         int idx = Integer.parseInt(request.getParameter("idx")); 
	         int u_idx = Integer.parseInt(request.getParameter("u_idx")); 
	         int v_idx = Integer.parseInt(request.getParameter("v_idx")); 
	         String title= request.getParameter("title");
	         String filename = request.getParameter("filename"); 
	         String gcontent = request.getParameter("gcontent");
	         String category = request.getParameter("category");
			 //int heart = Integer.parseInt(multi_request.getParameter("heart"));   
	         
	         GuguGallery vo = new GuguGallery();
	         vo.setCategory(category);
	         vo.setIdx(idx);
	         vo.setTitle(title);
	         vo.setFilename(filename);
	         vo.setGcontent(gcontent);
	         //vo.setHeart(heart);
	         gdao.update(vo);    
	         System.out.println("gallery update 성공!");
		return new ActionForward(true,"gallery.do?u_idx="+u_idx+"&v_idx="+v_idx);
	}
	
}
