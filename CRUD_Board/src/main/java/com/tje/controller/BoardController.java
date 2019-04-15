package com.tje.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.tje.model.Criteria;
import com.tje.model.PageMaker;
import com.tje.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	// 의존 관계 
	@Autowired
	private BoardService service;
	
	//글 쓰기 폼 GET 방식 불러오기
	@RequestMapping(value="/write",method=RequestMethod.GET)
	public String write()throws Exception{
		System.out.println("write 입니다. GET방식");
		
		return "/board/write";
	}
	
	// 글 쓰기 POST 방식 글 쓰기
	@RequestMapping(value="/write",method=RequestMethod.POST)
	public String insert(@ModelAttribute Board board)throws Exception{
		
		service.create(board);
		System.out.println("글쓰기 완료");
		return "redirect:/board/listPaging";
		
	}
	

	
	@RequestMapping(value = "/listPaging", method = RequestMethod.GET)
	public String listPaging(Model model, Criteria criteria) throws Exception {
		
		
		

	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCriteria(criteria);
	    // 수정
	    pageMaker.setTotalCount(service.countArticles(criteria));

	    model.addAttribute("list", service.listCriteria(criteria));
	    model.addAttribute("pageMaker", pageMaker);

	    return "/board/list_paging";
	}
	
	
	@RequestMapping(value = "/listCriteria", method = RequestMethod.GET)
	public String listCriteria(Model model, Criteria criteria) throws Exception {
	    model.addAttribute("articles", service.listCriteria(criteria));
	    return "/article/list_criteria";
	}
	


	
	
	
	
	
	/*
	 * // 게시글 목록 가저오기
	 * 
	 * // @RequestParam(defaultValue="") ==> 기본값 할당 : 현재페이지를 1로 초기화
	 * 
	 * @RequestMapping("list.do") public ModelAndView
	 * list(@RequestParam(defaultValue="title") String searchOption,
	 * 
	 * @RequestParam(defaultValue="") String
	 * keyword, @RequestParam(defaultValue="1") int curPage)throws Exception{
	 * System.out.println("전체목록 페이지");
	 * 
	 * // 레코드의 갯수 계산
	 * 
	 * // int count = service.countArticle(searchOption, keyword);
	 * 
	 * 
	 * List<Board> list = service.listAll(); ModelAndView mav = new ModelAndView();
	 * mav.setViewName("board/listAll"); mav.addObject("list",list);
	 * System.out.println("게시글 목록 가저오기 성공"); return mav;
	 * 
	 * }
	 */
	
	// 게시글 목록 가저오기
	
		// @RequestParam(defaultValue="") ==> 기본값 할당 : 현재페이지를 1로 초기화
		@RequestMapping(value="list",method=RequestMethod.GET)
		public ModelAndView list(ModelAndView model)throws Exception{
			System.out.println("전체목록 페이지");
			
			// 레코드의 갯수 계산
			
		//	int count = service.countArticle(searchOption, keyword);
			
			
			List<Board> list = service.listAll();
			model.setViewName("board/listAll");
			model.addObject("list",list);
			System.out.println("게시글 목록 가저오기 성공");
			return model;
			
		}
	
	//상세 게시글 ,조회수 증가 처리
	@RequestMapping(value="view",method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int b_no, HttpSession session)throws Exception{
		service.increaseViewcnt(b_no, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/read");
		mav.addObject("board", service.read(b_no));
		
		System.out.println("상세 게시글 가저오기 ");
		
		return mav;
	}
	
	
	@RequestMapping(value="/view")
    public String viewForm(@ModelAttribute("boardVO") Board boardVO, Model model, HttpServletRequest request) throws Exception{
        
        int code = Integer.parseInt(request.getParameter("b_no"));
        boardVO.setB_no(code);
        
        Board resultVO = service.selectBoardByCode(boardVO);
        
        model.addAttribute("result", resultVO);
        
        return "board/view";
    }
	
	
	// 게시글 수정 
	@RequestMapping(value="update",method =RequestMethod.POST)
	public String update(@ModelAttribute Board board) throws Exception{
		
		System.out.println(board.getB_title());
		service.update(board);
		
		System.out.println("게시글 수정 완료");
		return "redirect:/board/list";
	}
	
	// 게시글 삭제
	@RequestMapping("delete")
	public String delete(@RequestParam int b_no) throws Exception{
		service.delete(b_no);
		System.out.println("게시글 삭제 완료");
		return "redirect:/board/list";
	}

}
