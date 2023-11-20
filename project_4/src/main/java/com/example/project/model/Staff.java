package com.example.project.model;

public class Staff {
	private String sName;
	private String sNo;
	private String sPhone;
	private String sPart;
	private char sPosition;
	private String sBoss;
	private int cnt;

	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsNo() {
		return sNo;
	}
	public void setsNo(String sNo) {
		this.sNo = sNo;
	}
	public String getsPhone() {
		return sPhone;
	}
	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}
	public String getsPart() {
		return sPart;
	}
	public void setsPart(String sPart) {
		this.sPart = sPart;
	}
	public char getsPosition() {
		return sPosition;
	}
	public void setsPosition(char sPosition) {
		this.sPosition = sPosition;
	}
	public String getsBoss() {
		return sBoss;
	}
	public void setsBoss(String sBoss) {
		this.sBoss = sBoss;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

}
