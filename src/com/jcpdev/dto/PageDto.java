package com.jcpdev.dto;

import lombok.Data;

@Data
public class PageDto {
	private int currentPage;		//현재 페이지
	private int totalCount;			//글의 전체 갯수
	private int pageSize;			//한개페이지에 보여줄 글 갯수
	
	private int totalPage;			//전체 페이지 갯수
	private int startPage;
	private int endPage;			//꼭 필요하지 않습니다. 

	private int startNo;
	
	public PageDto(int currentPage, int totalCount, int pageSize) {   //외부(비지니스로직)에서 결정하고 전달되는값.
		this.totalCount=totalCount;
		this.pageSize=pageSize;
		
		totalPage = (totalCount-1)/pageSize + 1;
		this.currentPage= (currentPage > totalPage)? totalPage:currentPage;
		this.currentPage= (currentPage < 1)? 1:currentPage;
		
		startNo=(this.currentPage-1)*pageSize;
		
		startPage = (this.currentPage-1)/10*10+1;		 //페이지번호 리스트 10개씩 
		endPage = startPage+9;
		endPage = endPage > totalPage ? totalPage:endPage;	//totalPage 보다 큰값에 대한 제한.
	}
}