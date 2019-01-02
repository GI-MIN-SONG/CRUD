package com.tje.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tje.dao.MemberDAO;
import com.tje.model.Member;

@Service
public class MemberService {
	
	@Autowired 
	MemberDAO dao;


	
	
	//회원 가입 
	@Transactional
	public int insert(Member member) {
		
		this.dao.insert(member.getMember_address());
		
		return this.dao.insert(member);
	}

	

	// 아이디 체크 
		public int idcheck(String member_id) {
			return this.dao.idcheck(member_id);
		}
		
		
		
	// 회원 한명 검	
	public Member selectOne(Member member) {
		
		return this.dao.selectOne(member);
	}

}
