package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuguMateDao;

public class DeleteFriend implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int u_idx = Integer.parseInt(request.getParameter("u_idx"));
		int v_idx = Integer.parseInt(request.getParameter("v_idx"));
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("u_idx",u_idx);
		map.put("v_idx",v_idx);
		
		GuguMateDao dao = GuguMateDao.getInstance();
		dao.mydelete(map);
		dao.yourdelete(map);
		
		ActionForward forward = new ActionForward();
		forward.isRedirect = true;
		forward.url ="mateAction.do?u_idx="+u_idx+"&v_idx="+u_idx;
		
		
		return forward;
	}

}
