package com.jcpdev.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jcpdev.dto.BoardComment;
import com.jcpdev.dto.GuguBoard;
import com.jcpdev.mybatis.SqlSessionBean;

public class GuguBoardDao {
   SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
   private static GuguBoardDao dao = new GuguBoardDao();
   private GuguBoardDao() { }
   public static GuguBoardDao getInstance() {
      return dao;
   }
   

   public List<GuguBoard> getGuguBoard(Map<String, Integer> map) {
      List<GuguBoard> list = null;
      SqlSession mapper = factory.openSession();
      list = mapper.selectList("getguguboard", map);
      mapper.close();
      return list;
   }
   
   public void boardInput(GuguBoard guguboard) {
	   SqlSession mapper = factory.openSession();
	   mapper.insert("boardinput", guguboard);
	   mapper.commit();
	   mapper.close();
   }
   
   public void delete (int idx) {
	   SqlSession mapper = factory.openSession();
	   mapper.delete("guguBoard.delete", idx);
	   mapper.commit();
	   mapper.close();
   }
   
   public GuguBoard getOne(int idx) {
	      SqlSession mapper = factory.openSession();
	      GuguBoard dto = mapper.selectOne("guguBoard.getOne",idx);
	      mapper.close();
	      return dto;
	   }
   
   public void update (GuguBoard guguboard) {//GuguBoard 객체라야해요.
	      SqlSession mapper = factory.openSession();
	      mapper.update("guguBoard.update", guguboard);
	      mapper.commit();
	      mapper.close();
	   }

	//==============================[BoardComment]====================================
	public void CommentInsert(BoardComment dto) { //방명록에 댓글 등록
		SqlSession mapper = factory.openSession();
		mapper.insert("guguBoard.CommentInsert",dto);
		mapper.commit();
		mapper.close();
	}
	
	//게시글 고유의 idx에 해당되는 정보 불러오기
	public List<BoardComment> getCommentList(int book_idx){ // 해당 게시글의 댓글 전부 불러오기
		SqlSession mapper = factory.openSession();
		List<BoardComment> list = mapper.selectList("guguBoard.getComments",book_idx);
		mapper.close();
		return list;
	}
	public void CommentDelete(BoardComment dto) { //게시글댓글 삭제 (게시글댓글 자제의 idx와 댓글단 본인의 u_idx를 조건으로 
		SqlSession mapper = factory.openSession();
		mapper.delete("guguBoard.CommentDelete",dto);
		mapper.commit();
		mapper.close();		
	}
	
		public void heartupdate(int idx) {
			SqlSession mapper = factory.openSession();
			mapper.update("guguBoard.heart",idx);
			mapper.commit();
			mapper.close();		
		}

		public int getCount(int v_idx) {
			SqlSession mapper = factory.openSession();
			int cnt = mapper.selectOne("guguBoard.getCount",v_idx);
			mapper.close();
			return cnt;
		}

}