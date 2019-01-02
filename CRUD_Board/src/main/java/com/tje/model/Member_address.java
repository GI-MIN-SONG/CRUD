package com.tje.model;

public class Member_address {
	
	
	private int address_id;
	private String member_postcode;
	private String member_address;
	private String member_detail;
	
	
	
	  public  Member_address() {
			
		}
	
	
	public Member_address(int member_address_id, String member_postcode, String member_address, String member_detail) {
		
		this.address_id = member_address_id;
		this.member_postcode = member_postcode;
		this.member_address = member_address;
		this.member_detail = member_detail;
	}
	
	
	
	
	public int getMember_address_id() {
		return address_id;
	}
	public void setMember_address_id(int member_address_id) {
		this.address_id = member_address_id;
	}
	public String getMember_postcode() {
		return member_postcode;
	}
	public void setMember_postcode(String member_postcode) {
		this.member_postcode = member_postcode;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public String getMember_detail() {
		return member_detail;
	}
	public void setMember_detail(String member_detail) {
		this.member_detail = member_detail;
	}
	
	
	
	
	

}
