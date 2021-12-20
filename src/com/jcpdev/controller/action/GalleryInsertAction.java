package com.jcpdev.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.GuguGalleryDao;
import com.jcpdev.dto.GuguGallery;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class GalleryInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		GuguGalleryDao gdao = GuguGalleryDao.getInstance();
		String path="c:\\upload";     //서버컴퓨터 로컬경로
		int u_idx = 0;
		int v_idx = 0;
	      int size=10*1024*1024; //10MByte, 최대파일크기
	      try {
	    	  //업로드된 파일을 받을 수 있는  MultipartRequest타입의 request 객체 생성.
	         MultipartRequest multi_request = new MultipartRequest(request,path,size,"UTF-8",
	                                    new DefaultFileRenamePolicy());
	       
	         u_idx = Integer.parseInt(multi_request.getParameter("u_idx")); 
	         v_idx = Integer.parseInt(multi_request.getParameter("v_idx")); 
	         String title= multi_request.getParameter("title");
	         String filename = multi_request.getFilesystemName("filename"); 
	         String gcontent = multi_request.getParameter("gcontent");
	         String category = multi_request.getParameter("category");
			 //int heart = Integer.parseInt(multi_request.getParameter("heart"));   
	         
	         GuguGallery vo = new GuguGallery();
	         vo.setU_idx(u_idx);
	         vo.setTitle(title);
	         vo.setFilename(filename);
	         vo.setGcontent(gcontent);
	         vo.setCategory(category);
	         //vo.setHeart(heart);
	         gdao.insert(vo);    //업로드한 파일을 테이블 컬럼 값으로 저장.
	         System.out.println("gallery insert 성공!");
	      }catch(Exception e){   e.printStackTrace();   }
		return new ActionForward(true,"gallery.do?u_idx="+u_idx+"&v_idx="+v_idx);
	}
	
}
