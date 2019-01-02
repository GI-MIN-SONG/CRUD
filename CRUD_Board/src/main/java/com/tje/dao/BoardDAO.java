package com.tje.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tje.model.Board;

@Repository
public class BoardDAO  {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "com.tje.model.BoardMapper";

	// 게시판 추가
	public void create(Board board) throws Exception {
		sqlSession.insert(namespace+".insertBoard", board);
		
	}
	// 게시판 보기
	public List<Board> listAll(int start, int end, String searchOption, String keyword) throws Exception {
		
		// 검색옵션, 키워드 맵에 저장
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		//BETWEEN #{start}, #{end}에 입력될 값을 맵에 저장
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList(namespace + ".listAll", map);
	}
	// 게시판 상세
	public Board read(int b_no) throws Exception {
		return sqlSession.selectOne(namespace+".detailBoard",b_no);
	}
	// 게시판 삭제
	public void delete(int b_no) throws Exception {
		sqlSession.delete(namespace+".deleteBoard",b_no);
		
	}
	//게시판 수정
	public void update(Board board) throws Exception {
		sqlSession.update(namespace + ".updateBoard",board);
		
	}
	
	// 조회수 증가
	public void increaseViewcnt(int b_no) throws Exception{
		sqlSession.update(namespace + ".increaseViewcnt",b_no);
	}
	

}
