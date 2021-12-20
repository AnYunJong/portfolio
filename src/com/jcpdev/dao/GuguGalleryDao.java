package com.jcpdev.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jcpdev.dto.GalleryCategory;
import com.jcpdev.dto.GalleryComment;
import com.jcpdev.dto.GuguGallery;
import com.jcpdev.mybatis.SqlSessionBean;

public class GuguGalleryDao {
	
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	private static GuguGalleryDao dao = new GuguGalleryDao();
	
	private GuguGalleryDao() { }
	public static GuguGalleryDao getInstance() {
		return dao;
	}

	public List<GuguGallery> getList(int u_idx){ // 해당 유저의 갤러리 전부 불러오기
		SqlSession mapper = factory.openSession();
		List<GuguGallery> list = mapper.selectList("gallery.getAll",u_idx);
		mapper.close();
		return list;
	}
	
	public void insert(GuguGallery g) { //사진 등록
		SqlSession mapper = factory.openSession();
		mapper.insert("gallery.insert", g);
		mapper.commit();
		mapper.close();
	}
	
	public GuguGallery getOne(int idx){ // 사진 자체의 idx(primary)를 인자로 하나 불러오기. 수정할때 사용
		SqlSession mapper = factory.openSession();
		GuguGallery dto = mapper.selectOne("gallery.getOne", idx);
		mapper.close();
		return dto;
	}
	
	//갤러리 수정 업데이트
	public void update(GuguGallery dto) {
		SqlSession mapper = factory.openSession();
		mapper.update("gallery.update",dto);
		mapper.commit();
		mapper.close();		
	}
	
		//갤러리 삭제
		public void delete(int idx) {
			SqlSession mapper = factory.openSession();
			mapper.delete("gallery.delete",idx);
			mapper.commit();
			mapper.close();		
		}
		//==============================[galleryComment]====================================
		//<!--galleryComment 테이블 관련 sql  -->
		public void CommentInsert(GalleryComment g) { //사진 등록
			SqlSession mapper = factory.openSession();
			mapper.insert("gallery.CommentInsert",g);
			mapper.commit();
			mapper.close();
		}
		
		//사진 고유의 idx에 해당되는 정보 불러오기
		public List<GalleryComment> getCommentList(int gallery_idx){ // 해당 사진의 댓글 전부 불러오기
			SqlSession mapper = factory.openSession();
			List<GalleryComment> list = mapper.selectList("gallery.getComments",gallery_idx);
			mapper.close();
			return list;
		}
		public void CommentDelete(GalleryComment dto) {
			SqlSession mapper = factory.openSession();
			mapper.delete("gallery.CommentDelete",dto);
			mapper.commit();
			mapper.close();		
		}
		

		public void heartupdate(int idx) {
			SqlSession mapper = factory.openSession();
			mapper.update("gallery.heart",idx);
			mapper.commit();
			mapper.close();		
		}

		public List<String> category(int u_idx){
			SqlSession mapper = factory.openSession();
			List<String> list = null;
			list = 	mapper.selectList("gallery.category",u_idx);
			mapper.close();
			return list;
		}
		
		public List<GuguGallery> categorylist(GalleryCategory gcdto){
			SqlSession mapper = factory.openSession();
			List<GuguGallery> list = null;
			list = 	mapper.selectList("gallery.categorylist",gcdto);
			mapper.close();
			return list;
		}
		
		public void setting(int u_idx) {
			SqlSession mapper =factory.openSession();
			mapper.insert("gallery.setting", u_idx);
			mapper.commit();
			mapper.close();
		}		
		public void categoryadd(GalleryCategory dto) {
			SqlSession mapper =factory.openSession();
			mapper.insert("gallery.categoryadd", dto);
			mapper.commit();
			mapper.close();
		}	

}
