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

public class GalleryInsertBeforeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int u_idx = Integer.parseInt(request.getParameter("u_idx")); //홈의 idx
		int v_idx = Integer.parseInt(request.getParameter("v_idx")); //홈의 idx
		
		GuguGalleryDao gdao = GuguGalleryDao.getInstance();		
		List<String> category = gdao.category(v_idx);
		request.setAttribute("categorylist", category);
		
		request.setAttribute("v_idx", v_idx);
		
		
		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.url="view/galleryregist.jsp";
		return forward;
	}

}
