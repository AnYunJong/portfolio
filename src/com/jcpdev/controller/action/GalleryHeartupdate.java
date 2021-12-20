package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.GuguGalleryDao;

public class GalleryHeartupdate implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
		int u_idx = Integer.parseInt(request.getParameter("u_idx"));
		int v_idx = Integer.parseInt(request.getParameter("v_idx"));
		
	
		GuguGalleryDao dao = GuguGalleryDao.getInstance();
		if(session.getAttribute("readIdx") !=null){
			StringBuilder readIdx = (StringBuilder)session.getAttribute("readIdx");
			boolean status = readIdx.toString().contains("/"+idx+"/");
			if(!status) {   //읽은 글 목록 문자열에 idx 가 포함되어지 있지 않으면
				dao.heartupdate(idx);
				readIdx.append(idx + "/");   //읽은 글 목록에 추가
			}
		}else{
			StringBuilder readIdx=new StringBuilder("/");
			session.setAttribute("readIdx", readIdx);
		}
		
		ActionForward forward = new ActionForward();
		forward.isRedirect=true;
		forward.url="gallery.do?u_idx="+u_idx+"&v_idx="+v_idx;
		
		return forward;
	}

}
