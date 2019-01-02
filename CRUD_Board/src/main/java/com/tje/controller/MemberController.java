package com.tje.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	@RequestMapping(value="/signup.do", method=RequestMethod.GET)
	public String signupGET() {
		return "/member/signUp";
		
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
	
	// 회원 가입 POST
	
	// 파라메터에서 유효성 검사가 필요한 객체에 대해 @Valid 어노테이션을 추가
	// BindingResult 객체는 검증 결과에 대한 결과 정보들을 담고 있다.
	
	// 검증 결과 정보, 즉 BindingResult는 DispatcherServlet이 JSP에 넣어줍니다.
	// 즉 컨트롤러에서 뷰 이름을 반환하면 에러 내용을 바인딩해서 JSP에 넘겨줄 테니,
	// 값을 사용자에게 보여주라는 의미의 forwarding 개념이 깔려있습니다.
	
	// 파라미터에서 @Valid 어노테이션을 붙이는 유효성 검사에 대한 선언은 컨트롤러에서 하고,
	// 유효성 검사를 체크하는 그 근거는 UserVO 클래스에 작성합니다.
	
//	
//	@RequestMapping(value="/signup.do", method=RequestMethod.POST)
//	public String signupPOST(@ModelAttribute @Valid Member member,BindingResult result) {
//		//에러가 있는지 검사
//		if(result.hasErrors()) {
//			// 에러를 List로 저장한다
//			List<ObjectError> list = result.getAllErrors();
//			for( ObjectError error : list) {
//				System.out.println(error);
//			}
//			return "/member/signUp";
//		}
//		service.insert(member);
//		return "main";
//	}
//	
	
	@RequestMapping(value="/signup.do", method=RequestMethod.POST)
	public String signupPOST(Member member) {
		
		System.out.println("회원가입 요청");
		
		service.insert(member);
		return "main";
	}
//	
//	@RequestMapping(value="/signup.do", method=RequestMethod.POST)
//	public String signupPOST(Member member){
//		
//		System.out.println("회원가입 요청");
//		
//		service.insert(member);
//		return "main";
//	}
//	
	

}
