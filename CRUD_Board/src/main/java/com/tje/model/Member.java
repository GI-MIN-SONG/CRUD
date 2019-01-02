package com.tje.model;

import java.util.Date;

import javax.validation.constraints.Pattern;

import org.apache.ibatis.ognl.MemberAccess;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class Member {
	
	
	//@NotEmpty
	//@Length(min=6, max=12)
	String member_id;
	
	//@NotEmpty
    //@Pattern(regexp="(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=])(?=\\S+$).{8,}")
	String member_pwd;
	
	//@NotEmpty
	//@Length(min=2, max=20)
	String member_name;
	
	//@NotEmpty
	//@Email
	String member_email;
	
	
	String member_gender;
	
	String member_photo;
	Date member_date;
	
	private String member_address_id;
	
	private Member_address member_address;
	
	
	
public Member() {
		
	}
	
	
	
	
	
	public Member_address getMember_address() {
		return member_address;
	}
	public String getMember_address_id() {
		return member_address_id;
	}
	public void setMember_address_id(String member_address_id) {
		this.member_address_id = member_address_id;
	}
	public void setMember_address(Member_address member_address) {
		this.member_address = member_address;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_photo() {
		return member_photo;
	}
	public void setMember_photo(String member_photo) {
		this.member_photo = member_photo;
	}
	public Date getMember_date() {
		return member_date;
	}
	public void setMember_date(Date member_date) {
		this.member_date = member_date;
	} 
	
	
	
	

}
