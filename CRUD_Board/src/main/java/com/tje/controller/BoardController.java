package com.tje.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tje.model.Board;
import com.tje.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	// 의존 관계 
	@Autowired
	private BoardService service;
	
	//글 쓰기 폼 불러오기
	@RequestMapping(value="/write.do",method=RequestMethod.GET)
	public String write()throws Exception{
		System.out.println("write 입니다. GET방식");
		
		return "/board/write";
	}
	
	// 글 쓰기
	@RequestMapping(value="/insert.do",method=RequestMethod.POST)
	public String insert(@ModelAttribute Board board)throws Exception{
		
		service.create(board);
		System.out.println("글쓰기 완료");
		return "redirect:/board/list.do";
		
	}
	// 게시글 목록 가저오기
	
	// @RequestParam(defaultValue="") ==> 기본값 할당 : 현재페이지를 1로 초기화
	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam(defaultValue="title") String searchOption,
			@RequestParam(defaultValue="") String keyword, @RequestParam(defaultValue="1") int curPage)throws Exception{
		System.out.println("전체목록 페이지");
		
		// 레코드의 갯수 계산
		
	//	int count = service.countArticle(searchOption, keyword);
		
		
//		List<Board> list = service.listAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/listAll");
//		mav.addObject("list",list);
		System.out.println("게시글 목록 가저오기 성공");
		return mav;
		
	}
	
	//상세 게시글 ,조회수 증가 처리
	@RequestMapping(value="view",method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int b_no, HttpSession session)throws Exception{
		service.increaseViewcnt(b_no, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/view");
		mav.addObject("board", service.read(b_no));
		
		System.out.println("상세 게시글 가저오기 ");
		
		return mav;
	}
	
	
	// 게시글 수정 
	@RequestMapping(value="update.do",method =RequestMethod.POST)
	public String update(@ModelAttribute Board board) throws Exception{
		
		System.out.println(board.getB_title());
		System.out.println(board.getB_detail());
		service.update(board);
		
		System.out.println("게시글 수정 완료");
		return "redirect:/board/list.do";
	}
	
	// 게시글 삭제
	@RequestMapping("delete.do")
	public String delete(@RequestParam int b_no) throws Exception{
		service.delete(b_no);
		System.out.println("게시글 삭제 완료");
		return "redirect:/board/list.do";
	}

}
