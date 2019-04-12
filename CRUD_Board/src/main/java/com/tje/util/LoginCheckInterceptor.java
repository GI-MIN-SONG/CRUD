package com.tje.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.tje.model.Member;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	public boolean preHandle (HttpServletRequest req, HttpServletResponse res , Object handler) throws Exception {
		
		HttpSession session = req.getSession(false);
		
		if(session == null) {
			res.sendRedirect(req.getContextPath()+"/member/loginInterceptor");
			return false;
		}
		
		Member member = (Member)session.getAttribute("loginmember");
		
		if(member == null) {
			res.sendRedirect(req.getContextPath()+"/member/loginInterceptor");
			return false;
		}
		System.out.println("세션정보 :"+session.getId());
		System.out.println("로그인 인터셉터 실행");
		
		return true;
		
	}

}
