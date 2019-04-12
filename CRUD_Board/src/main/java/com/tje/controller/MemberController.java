package com.tje.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.tje.model.Member;
import com.tje.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// 회원 가입 GET
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String signupGET() {
		return "/member/signUp";
		
	}
	
	// 회원 가입 POST 
	// 데이터 처리
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String signupPOST(Member member) {
		
		System.out.println("회원가입 요청");
		
		service.insert(member);
		return "main";
	}
	/*
	// 회원 가입 GET
		@RequestMapping(value="/sign", method=RequestMethod.GET)
		public String signupGET2() {
			
			return "/member/sign";
		}
	*/
	// 로그인 폼 GET 방식
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm() {
		return "/member/login";
	}
	
	// 로그인 처리 POST 방식
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginResult(HttpSession session,Member member) {
		
		
		
		member = service.login(member);
		
		if(member == null) {
			System.out.println("로그인 실패");
			return "/member/loginResult";
		}else {
			session.setAttribute("loginmember", member);
			System.out.println("로그인 성공 세션 정보 :" + session.getId());
			return "/member/loginResult";
		}
		

	}
	
	// 인터셉터 부분 
	@RequestMapping(value="/loginInterceptor", method=RequestMethod.GET)
	public String loginInterceptor() {
		return "/member/loginInterceptor";
	}
	
	// 로그아웃
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String Logout(HttpSession session,HttpServletResponse res,HttpServletRequest req)throws Exception {
		session = req.getSession(false);
		
		if(session != null) {
			session.removeAttribute("loginmember");
		}
		
		
		res.sendRedirect(req.getContextPath()+"/");
		
		return null;
		
	}
	
	
	
	
	

	
	
	@ResponseBody
	@RequestMapping(value="/idcheck", method=RequestMethod.POST)
	public Map<Object, Object> idcheck(@RequestBody String member_id) {
		
		System.out.println("검색을 요청한 ID : "+member_id);
		
		int count = 0;
		HashMap<Object,Object> map = new HashMap<Object,Object>();
			
		count = service.idcheck(member_id);
		map.put("cnt",count);
		System.out.println("아이디 체크 카운트 : "+count);
	

		return map;
		
	}
	
	
	

}
