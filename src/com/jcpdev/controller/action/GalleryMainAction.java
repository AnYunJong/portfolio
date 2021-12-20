package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuguGalleryDao;
import com.jcpdev.dao.GuguUserDao;
import com.jcpdev.dto.GuguGallery;
import com.jcpdev.dto.TotalProfile;

public class GalleryMainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int v_idx = Integer.parseInt(request.getParameter("v_idx")); //홈의 idx
		
		GuguGalleryDao gdao = GuguGalleryDao.getInstance();		
		List<GuguGallery> list = gdao.getList(v_idx); //사진정보
		
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
