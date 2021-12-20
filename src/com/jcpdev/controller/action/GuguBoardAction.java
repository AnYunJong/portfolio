package com.jcpdev.controller.action;

import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuguBoardDao;
import com.jcpdev.dao.GuguUserDao;
import com.jcpdev.dto.GuguBoard;
import com.jcpdev.dto.PageDto;

public class GuguBoardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		//비지니스 로직을 처리하는 jsp 파일
		GuguBoardDao dao = GuguBoardDao.getInstance();
		//페이지 번호는 파라미터로 전달됩니다.
		int pageNo;
		int u_idx = Integer.parseInt(request.getParameter("u_idx"));
		int v_idx = Integer.parseInt(request.getParameter("v_idx"));
		
		if(request.getParameter("page")==null) pageNo=1;
		else pageNo = Integer.parseInt(request.getParameter("page"));   //page=1,2,3,4,.....

		int pageSize =5;		//ui로 변경하도록 구현할 수 있습니다.
		
		PageDto pageDto = new PageDto(pageNo,dao.getCount(v_idx),pageSize);  //페이지처리에 필요한객체(값) 생성
									//  	, v_idx의 총 게시물 		,게시물 5개씩
		Map<String,Integer> map = new HashMap<>();
		map.put("u_idx",v_idx);
		map.put("pageSize",pageSize);
		map.put("startNo",pageDto.getStartNo());
		List<GuguBoard> list = dao.getGuguBoard(map); //목록가져오기

		request.setAttribute("today", LocalDate.now());
		request.setAttribute("pageDto", pageDto);     //페이지처리에 필요한 값들
		request.setAttribute("list", list);
		request.setAttribute("v_idx", v_idx);
		
		GuguUserDao udao = GuguUserDao.getInstance();
		String name = udao.getName(v_idx);
		request.setAttribute("name", name);
		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		foward.url="view/boardlist.jsp";
		return foward;
	}

}