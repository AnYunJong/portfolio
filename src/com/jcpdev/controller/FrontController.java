package com.jcpdev.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.controller.action.Action;
import com.jcpdev.controller.action.ActionForward;
import com.jcpdev.controller.action.BoardCommentDeleteAction;
import com.jcpdev.controller.action.BoardCommentInsertAction;
import com.jcpdev.controller.action.BoardCommentListAction;
import com.jcpdev.controller.action.BoardHeartupdate;
import com.jcpdev.controller.action.DeleteFriend;
import com.jcpdev.controller.action.GalleryCategoryAction;
import com.jcpdev.controller.action.GalleryCategoryAdd;
import com.jcpdev.controller.action.GalleryCommentDeleteAction;
import com.jcpdev.controller.action.GalleryCommentInsertAction;
import com.jcpdev.controller.action.GalleryCommentListAction;
import com.jcpdev.controller.action.GalleryDeleteAction;
import com.jcpdev.controller.action.GalleryHeartupdate;
import com.jcpdev.controller.action.GalleryInsertAction;
import com.jcpdev.controller.action.GalleryInsertBeforeAction;
import com.jcpdev.controller.action.GalleryMainAction;
import com.jcpdev.controller.action.GalleryUpdateAction;
import com.jcpdev.controller.action.GalleryUpdateViewAction;
import com.jcpdev.controller.action.GbookCommentDeleteAction;
import com.jcpdev.controller.action.GbookCommentInsertAction;
import com.jcpdev.controller.action.GbookCommentListAction;
import com.jcpdev.controller.action.GuestBookAction;
import com.jcpdev.controller.action.GuestBookAddAction;
import com.jcpdev.controller.action.GuestBookDeleteAction;
import com.jcpdev.controller.action.GuestBookSaveAction;
import com.jcpdev.controller.action.GuguBoardAction;
import com.jcpdev.controller.action.GuguBoardDelete;
import com.jcpdev.controller.action.GuguBoardDetailAction;
import com.jcpdev.controller.action.GuguBoardSave;
import com.jcpdev.controller.action.GuguBoardUpdataView;
import com.jcpdev.controller.action.GuguBoardUpdateSave;
import com.jcpdev.controller.action.GuguBoardAction;
import com.jcpdev.controller.action.LoginAction;
import com.jcpdev.controller.action.LogoutAction;
import com.jcpdev.controller.action.LookForEmailAction;
import com.jcpdev.controller.action.LookForPWAction;
import com.jcpdev.controller.action.MateAction;
import com.jcpdev.controller.action.MemberAction;
import com.jcpdev.controller.action.MiniHomeAction;
import com.jcpdev.controller.action.NewFriendAction;
import com.jcpdev.controller.action.NewMateAction;
import com.jcpdev.controller.action.ProfileMainAction;
import com.jcpdev.controller.action.ProfileModifyAction;
import com.jcpdev.controller.action.ProfileUpdateAction;
import com.jcpdev.controller.action.RequestFriendAction;
import com.jcpdev.controller.action.RequestMateAction;
import com.jcpdev.controller.action.ShortIntroUpdateAction;
import com.jcpdev.controller.action.TitleUpdateAction;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	//요청Method 구별없이 실행 -> doGet() 또는 doPost()메소드 실행내용 있으면 실행.
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward=null; 
		String spath = request.getServletPath();
		String path="home.jsp";
		String url ="./";   //또는 request.getContextPath();
		
		if(spath.equals("/member.do")) { //회원가입 양식으로 이동해서 파라미터값 입력  
			path = "user/member.jsp";
			forward = new ActionForward(false,path); 
		}else if(spath.equals("/member_save.do")) { // 양식에 적었던 파라미터값을 dao.insert
			Action action = new MemberAction();
			forward = action.execute(request, response);      
		}else if(spath.equals("/login.do")) {  // 로그인 할수있는 jsp (이메일,비번 파라미터 입력)
			path = "user/loginView.jsp";
			forward = new ActionForward(false,path); 
		}else if(spath.equals("/loginAction.do")) {// 이메일,비번 파라미터값을 dao.login
			Action action = new LoginAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/logout.do")) { // 세션을 초기화하여 로그아웃 상태를 만든다.-----------------------------------------------
			Action action = new LogoutAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/home.do")) {  // 로그인,로그아웃 후 임시이동 
			path = "index.jsp";
			forward = new ActionForward(false,path);
		}else if(spath.equals("/lostPW.do")) {  // 비번 잊어버림
			path = "user/lostPW.jsp";
			forward = new ActionForward(false,path); 
		}else if(spath.equals("/lookForPW.do")) { // 비번찾기 dao.lookForPW
			Action action = new LookForPWAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/lostEmail.do")) {  // email 잊어버림
			path = "user/lostEmail.jsp";
			forward = new ActionForward(false,path); 
		}else if(spath.equals("/lookForEmail.do")) { // email(아이디)찾기 dao.lookForEmail
			Action action = new LookForEmailAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/profileMain.do")) {  // 자신의 프로필을 볼수 있는곳 (수정x)--------------------------------------------
			Action action = new ProfileMainAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/profileModify.do")) {  // 수정 입력하기위해 이동
			Action action = new ProfileModifyAction();
			forward = action.execute(request, response); 
		}else if(spath.equals("/profileUpdate.do")) {  // 로그인,로그아웃 후 임시이동 
			Action action = new ProfileUpdateAction();
			forward = action.execute(request, response); 
		}else if(spath.equals("/gallery.do")) {  // 자신의 갤러리를 볼수 있는곳 (수정x)------------------------------------------
			Action action = new GalleryMainAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/gallerycategory.do")) { //추가 10월 25일 13시-
			Action action = new GalleryCategoryAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/galleryRegist.do")) {
			Action action = new GalleryInsertBeforeAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/galleryInsert.do")) {  
			Action action = new GalleryInsertAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/galleryUpdateView.do")) {
			Action action = new GalleryUpdateViewAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/galleryUpdate.do")) {
			Action action = new GalleryUpdateAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/categoryadd.do")) {
			Action action = new GalleryCategoryAdd();
			forward = action.execute(request, response);
		}					
		
		//친구 mate 맺기 관련  do
		// minjae(10월 19일에 받은 민재씨꺼)
		else if(spath.equals("/minihome.do")) {
			Action action = new MiniHomeAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/mateAction.do")) {
			Action action = new MateAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/newfriend.do")) {
			Action action = new NewFriendAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/newmate.do")) {
			Action action = new NewMateAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/requestfriendaction.do")) {
			Action action = new RequestFriendAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/requestmateaction.do")) {
			Action action = new RequestMateAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/deletefriend.do")) {
			Action action = new DeleteFriend();
			forward = action.execute(request, response);
		}
		
		
		//갤러리 사진 삭제와, 댓글 남기기, 삭제					
		else if(spath.equals("/galleryDelete.do")) {
			Action action = new GalleryDeleteAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/galleryCommentInsert.do")) {
			Action action = new GalleryCommentInsertAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/galleryCommentList.do")) {
			Action action = new GalleryCommentListAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/galleryCommentDelete.do")) {
			Action action = new GalleryCommentDeleteAction();
			forward = action.execute(request, response);
		}
						
		//방명록남기기
		else if(spath.equals("/guestbook.do")) { 
			Action action = new GuestBookAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/guestbookadd.do")) { 
			Action action = new GuestBookAddAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/guestbooksave.do")) { 
			Action action = new GuestBookSaveAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/guestbookdelete.do")) { 
			Action action = new GuestBookDeleteAction();
			forward = action.execute(request, response);
		}
		
		
		//게시판 추가
		else if(spath.equals("/guguboard.do")) {
			Action action = new GuguBoardAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/newboard.do")) {
			path="view/boardinsert.jsp";
			forward=new ActionForward(false,path);
		}else if(spath.equals("/newboardsave.do")) {
			Action action = new GuguBoardSave();
			forward = action.execute(request, response);
		}else if(spath.equals("/boarddetail.do")) {
			Action action = new GuguBoardDetailAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/boardupdate.do")) {
			Action action = new GuguBoardUpdataView();
			forward = action.execute(request, response);
		}else if(spath.equals("/updatesave.do")) {
			Action action = new GuguBoardUpdateSave();
			forward = action.execute(request, response);
		}else if(spath.equals("/boarddelete.do")) {
			Action action = new GuguBoardDelete();
			forward = action.execute(request, response);
		}
		
		//방명록 댓글 관련
		else if(spath.equals("/gbookCommentInsert.do")) {
			Action action = new GbookCommentInsertAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/gbookCommentList.do")) {
			Action action = new GbookCommentListAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/gbookCommentDelete.do")) {
			Action action = new GbookCommentDeleteAction();
			forward = action.execute(request, response);
		}
		//게시판 댓글 관련
		else if(spath.equals("/boardCommentInsert.do")) {
			Action action = new BoardCommentInsertAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/boardCommentList.do")) {
			Action action = new BoardCommentListAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/boardCommentDelete.do")) {
			Action action = new BoardCommentDeleteAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/shortUpdate.do")) {  //짧은 소개글 업데이트
			Action action = new ShortIntroUpdateAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/titleUpdate.do")) {  //짧은 소개글 업데이트
			Action action = new TitleUpdateAction();
			forward = action.execute(request, response);
		}
		
		// 좋아요 
		else if(spath.equals("/galleryheartupdate.do")) {
			Action action = new GalleryHeartupdate();
			forward = action.execute(request, response);
		}else if(spath.equals("/BoardHeartupdate.do")) {
			Action action = new BoardHeartupdate();
			forward = action.execute(request, response);
		}
		
		
		//이 시점에 forward 에 isRedirect 와 url 값이 저장되었으면 ok!
		if(forward.isRedirect()) {   //타입 boolean 일때는 getXXX 아니고 isXXX 입니다.
			response.sendRedirect(forward.getUrl());
		}else {
			RequestDispatcher rd 
			= request.getRequestDispatcher(forward.getUrl()); //getRequest가지로 전달
			rd.forward(request, response);
		}
		
	}

}
