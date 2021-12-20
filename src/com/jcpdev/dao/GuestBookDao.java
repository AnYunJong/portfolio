package com.jcpdev.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jcpdev.dto.GbookComment;
import com.jcpdev.dto.GuestBook;
import com.jcpdev.mybatis.SqlSessionBean;

public class GuestBookDao {
	private static GuestBookDao dao = new GuestBookDao();
	
	private GuestBookDao() {}
	
	public static GuestBookDao getInstance() {
		return dao;
	}
	
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory(); 
	
	public List<GuestBook> getList(int idx){
		SqlSession mapper = factory.openSession();
		List<GuestBook> list = mapper.selectList("guestbook.getlist", idx);
		mapper.close();
		return list;
	}
	
	public void insert(GuestBook guestbook) {
		SqlSession mapper = factory.openSession();
		mapper.insert("guestbook.insert", guestbook);
		mapper.commit();
		mapper.close();
	}
	
	public void delete(int idx) {
		SqlSession mapper = factory.openSession();
		mapper.delete("guestbook.delete", idx);
		mapper.commit();
		mapper.close();
	}
	
		//==============================[gbookComment]====================================
		public void CommentInsert(GbookComment g) { //방명록에 댓글 등록
			SqlSession mapper = factory.openSession();
			mapper.insert("guestbook.CommentInsert",g);
			mapper.commit();
			mapper.close();
		}
		
		//방명록 고유의 idx에 해당되는 정보 불러오기
		public List<GbookComment> getCommentList(int book_idx){ // 해당 방명록의 댓글 전부 불러오기
			SqlSession mapper = factory.openSession();
			List<GbookComment> list = mapper.selectList("guestbook.getComments",book_idx);
			mapper.close();
			return list;
		}
		public void CommentDelete(GbookComment dto) { //방명록 댓글 삭제 (방명록댓글 자제의 idx와 댓글단 본인의 u_idx를 조건으로 
			SqlSession mapper = factory.openSession();
			mapper.delete("guestbook.CommentDelete",dto);
			mapper.commit();
			mapper.close();		
		}
	
	
}
