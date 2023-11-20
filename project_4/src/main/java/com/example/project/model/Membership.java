package com.example.project.model;

public class Membership {
	//멤버쉽
	private int mNo;
	private char mStatus;
	private String mRegDate;
	private String mExpDate;
	private String uId;
	private String mArtist;
	private char kitYn;
	
	
	
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public char getKitYn() {
		return kitYn;
	}
	public void setKitYn(char kitYn) {
		this.kitYn = kitYn;
	}
	public String getmArtist() {
		return mArtist;
	}
	public void setmArtist(String mArtist) {
		this.mArtist = mArtist;
	}
	public int getMno() {
		return mNo;
	}
	public void setMno(int mno) {
		mNo = mno;
	}
	public char getmStatus() {
		return mStatus;
	}
	public void setmStatus(char mStatus) {
		this.mStatus = mStatus;
	}
	public String getmRegDate() {
		return mRegDate;
	}
	public void setmRegDate(String mRegDate) {
		this.mRegDate = mRegDate;
	}
	public String getmExpDate() {
		return mExpDate;
	}
	public void setmExpDate(String mExpDate) {
		this.mExpDate = mExpDate;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	
	
	
}
