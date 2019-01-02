package com.tje.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.dao.BoardDAO;
import com.tje.model.Board;

@Service
public class BoardService   {

	@Autowired
	private BoardDAO dao;
	
	// 게시글 작성
	public void create(Board board) throws Exception {
		//dao.create(board);
		
		String title = board.getB_title();
		String detail = board.getB_detail();
		String writer = board.getB_writer();
		// * 태그문자 처리 (< ==> &lt; > ==> &gt;)
		// replace(A, B ) A를 B로 변경
		title = title.replace("<", "&lt;");
		title = title.replace("<", "&gt;");
		writer = writer.replace("<", "&lt;");
		writer = writer.replace("<", "&gt;");
		
		// *공백문자 처리
		title = title.replace("  ", "&nbsp;&nbsp");
		writer = writer.replace("  ", "&nbsp;&nbsp");
		
		// * 줄바꿈 문자처리
		detail = detail.replace("\n", "<br>");
		board.setB_title(title);
		board.setB_detail(detail);
		board.setB_writer(writer);
		dao.create(board);
	}
	
	// 게시글 전체 보기
	public List<Board> listAll(int start, int end, String searchOption, String keyword) throws Exception {
		
		return dao.listAll(start,end,searchOption,keyword);
	}
	
	// 게시글 상세보기
	public Board read(int b_no) throws Exception {
		
		return dao.read(b_no);
	}
	
	// 게시글 삭제
	public void delete(int b_no) throws Exception {
		
		dao.delete(b_no);
		
	}
	// 게시글 수정
	public void update(Board board) throws Exception {
		
		 dao.update(board);
		
	}
	
	// 게시글 조회수 증가
	public void increaseViewcnt(int b_no, HttpSession session) throws Exception{
		long update_time = 0;
		if(session.getAttribute("update_time_"+b_no) != null) {
			update_time = (long)session.getAttribute("update_time_"+b_no);
		}
		long current_time = System.currentTimeMillis();
		
		if(current_time - update_time > 5*1000) {
			dao.increaseViewcnt(b_no);
			session.setAttribute("update_time_"+b_no,current_time);
		}
	}

}
