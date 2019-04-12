package com.tje.model;

import java.util.Date;


public class Board {
	
	int b_no;
	String b_title;
	String b_content;
	String b_writer;
	Date b_date;
	int b_count;
	
	



	public Board() {
	}



	public int getB_no() {
		return b_no;
	}



	public void setB_no(int b_no) {
		this.b_no = b_no;
	}



	public String getB_title() {
		return b_title;
	}



	public void setB_title(String b_title) {
		this.b_title = b_title;
	}





	public String getB_writer() {
		return b_writer;
	}



	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}



	public Date getB_date() {
		return b_date;
	}



	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}



	public int getB_count() {
		return b_count;
	}



	public void setB_count(int b_count) {
		this.b_count = b_count;
	}
	
	
	
	
	
	public String getB_content() {
		return b_content;
	}



	public void setB_content(String b_content) {
		this.b_content = b_content;
	}



	public String toString() {
		return "Board [b_no=" + b_no
				+ ", title=" + b_title 
				+ ", content =" + b_content 
				+ ", writer =" + b_writer
				+ ", date =" + b_date
				+ ", count =" + b_count
				+"]";
	}
	
	

}
