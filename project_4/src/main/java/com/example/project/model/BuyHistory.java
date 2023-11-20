package com.example.project.model;

public class BuyHistory {

	private String uId;
	private String pNo;
	private int price;
	private String bhArtist;
	private int bhPoint;
	private String bhSysdate;
	
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getpNo() {
		return pNo;
	}
	public void setpName(String pNo) {
		this.pNo = pNo;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getBhArtist() {
		return bhArtist;
	}
	public void setBhArtist(String bhArtist) {
		this.bhArtist = bhArtist;
	}
	public int getBhPoint() {
		return bhPoint;
	}
	public void setBhPoint(int bhPoint) {
		this.bhPoint = bhPoint;
	}
	public String getBhSysdate() {
		return bhSysdate;
	}
	public void setBhSysdate(String bhSysdate) {
		this.bhSysdate = bhSysdate;
	}
	
	
}
