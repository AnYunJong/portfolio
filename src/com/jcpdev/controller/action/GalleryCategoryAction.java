package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuguGalleryDao;
import com.jcpdev.dao.GuguUserDao;
import com.jcpdev.dto.GalleryCategory;
import com.jcpdev.dto.GuguGallery;
import com.jcpdev.dto.TotalProfile;

public class GalleryCategoryAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int v_idx = Integer.parseInt(request.getParameter("v_idx")); //홈의 idx
		String categoryname = request.getParameter("category");
		
		GuguGalleryDao gdao = GuguGalleryDao.getInstance();	
		GalleryCategory gcdto = new GalleryCategory(v_idx, categoryname);
		List<GuguGallery> list = gdao.categorylist(gcdto); //사진정보
		List<String> category = gdao.category(v_idx);
		
		request.setAttribute("glist", list); 
		request.setAttribute("categorylist", category); 
		request.setAttribute("v_idx", v_idx);
		
		GuguUserDao udao = GuguUserDao.getInstance();
		String name = udao.getName(v_idx);
		request.setAttribute("name", name);
		
		
		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.url="view/gallery.jsp";
		return forward;
	}

}
