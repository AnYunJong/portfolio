package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.GuguHomeDao;
import com.jcpdev.dao.GuguMateDao;
import com.jcpdev.dao.GuguUserDao;
import com.jcpdev.dto.GuguHome;
import com.jcpdev.dto.TotalProfile;

public class MiniHomeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int u_idx = Integer.parseInt(request.getParameter("u_idx"));
		int v_idx = Integer.parseInt(request.getParameter("v_idx"));
		
		GuguHomeDao dao = GuguHomeDao.getInstance();
		
		HttpSession session = request.getSession();
		if(session.getAttribute("readIdx") !=null){
			StringBuilder readIdx = (StringBuilder)session.getAttribute("readIdx");
			boolean status = readIdx.toString().contains("/"+v_idx+"/");
			if(!status){		
				dao.updateCount(v_idx);
				readIdx.append(v_idx + "/");
			}
		} else{
			StringBuilder readIdx = new StringBuilder("/");
			session.setAttribute("readIdx", readIdx);
		}
		
		if(dao.userhome(v_idx)==null) {
			GuguHome dto =new GuguHome();
			dto.setU_idx(v_idx);
			dao.insert(dto);
		}
		GuguHome dto = dao.userhome(v_idx);
		
		
		
		
		GuguMateDao mdao = GuguMateDao.getInstance();
		int count = mdao.mateCount(v_idx);
		
		
		GuguUserDao udao = GuguUserDao.getInstance();
		String name = udao.getName(v_idx);
		
		request.setAttribute("name", name);
		request.setAttribute("homeuser", dto);
		request.setAttribute("count", count);
		
		String short_intro = udao.getIntro(v_idx); //짧은 소개글 조회
		request.setAttribute("short_intro", short_intro);// 보내기
		String title = udao.getTitle(v_idx); // 타이틀을 조회
		request.setAttribute("title", title );// 보내기
		
		TotalProfile bean = udao.getOne(v_idx);
		request.setAttribute("profile", bean);
		
		ActionForward forward = new ActionForward();
		forward.isRedirect = false;
		forward.url = "view/home.jsp";
		return forward;
	}

}
