package com.codeshot.model;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.codeshot.db.SqlSessionManager;

public class PostDAO 
{
	
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	//2022-11-01-조영찬/게시글 전체 목록 불러오기
	public List<PostDTO> showPost() 
	{
		SqlSession session = sqlSessionFactory.openSession(true);
		List<PostDTO> postList = session.selectList("showPost");
		session.close();
		return postList;
	}
	
	//2022-11-01-김지수/게시글 검색
	public List<PostDTO> searchPost(String userInput) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<PostDTO> postList = session.selectList("searchPost", userInput);
		session.close();
		return postList;
	}
	
	//2022-11-03-고정연/소스코드 게시물 업로드
	public int uploadCodePost(PostDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.insert("uploadCodePost",dto);
		session.close();
		return row;
	}
	
	//2022-11-07-고정연/외주 게시물 업로드
	public int uploadOtsPost(PostDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.insert("uploadOtsPost",dto);
		session.close();
		return row;
	}
	
	//2022-11-08-고정연/게시물 세부내용 조회
	public PostDTO showPostDetail(BigDecimal post_num) {
		SqlSession session = sqlSessionFactory.openSession(true);
		PostDTO post = session.selectOne("showPostDetail", post_num);
		session.close();
		return post;
	}
	
	//2022-11-08-고정연/게시물 관리 목록 불러오기
	public List<PostDTO> showMyPost(String mem_email){
		SqlSession session = sqlSessionFactory.openSession(true);
		List<PostDTO> postList = session.selectList("showMyPost",mem_email);
		session.close();
		return postList;
	}
	
	//2022-11-08-고정연/게시물 수정(첨부파일 수정 있음)
	public int updatePostFileY(PostDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.update("updatePostFileY", dto);
		session.close();
		return row;
	}
	
	//2022-11-09-고정연/게시물 수정(첨부파일 수정 없음)
	public int updatePostFileN(PostDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.update("updatePostFileN", dto);
		session.close();
		return row;
	}
	
	//2022-11-08-고정연/게시물 삭제
	public int deletePost(BigDecimal post_num) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.delete("deletePost", post_num);
		session.close();
		return row;
	}
}
