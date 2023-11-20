package com.example.project.model;

public class Ban {
	//유저 밴
	private String uId;
	private char bYn;
	private String bReasons;
	private String bDate;
	
	public String getbDate() {
		return bDate;
	}
	public void setbDate(String bDate) {
		this.bDate = bDate;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public char getbYn() {
		return bYn;
	}
	public void setbYn(char bYn) {
		this.bYn = bYn;
	}
	public String getbReasons() {
		return bReasons;
	}
	public void setbReasons(String bReasons) {
		this.bReasons = bReasons;
	}
	
	

	
}
