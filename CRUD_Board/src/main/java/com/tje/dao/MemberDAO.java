package com.tje.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tje.model.Member;
import com.tje.model.Member_address;


@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession session;
	private String strNameSpace = "com.tje.model.MemberMapper";

	public void insertMember(Member member) {
		session.insert("insertMember",member);
		
	}
	
	
	// address 자동증가
		public int insert(Member_address member_address) {
			System.out.println(member_address.getMember_address_id());
			return session.insert(strNameSpace + ".insertAddress", member_address);
		}

		// 멤버 insert
		public int insert(Member member) {
			return session.insert(strNameSpace + ".insertMember", member);
		}


		public Member selectOne(Member member) {
			
			return session.selectOne(strNameSpace + ".oneMember", member);
		}
		
		



		public int idcheck(String member_id) {
			
			return session.selectOne(strNameSpace + ".idcheck", member_id);
		}

}
