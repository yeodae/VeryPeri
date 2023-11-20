package com.example.project.model;

import lombok.Data;

@Data
public class Wish {

	private String uId;
	private String pNo;
	private int afNo;
	private int wnum;
	private int price;
	private int point;
	private int stock;
	private char membership;
	private char soldout;
	private int pLimit;
	private String pDate;
	private String category;
	private String artist;
	private String fYn;
	private String pImg;
	private String pName;
	private String path;
	
	
	
	public int getWnum() {
		return wnum;
	}
	public void setWnum(int wnum) {
		this.wnum = wnum;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public char getMembership() {
		return membership;
	}
	public void setMembership(char membership) {
		this.membership = membership;
	}
	public char getSoldout() {
		return soldout;
	}
	public void setSoldout(char soldout) {
		this.soldout = soldout;
	}
	public int getpLimit() {
		return pLimit;
	}
	public void setpLimit(int pLimit) {
		this.pLimit = pLimit;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getfYn() {
		return fYn;
	}
	public void setfYn(String fYn) {
		this.fYn = fYn;
	}
	public String getpImg() {
		return pImg;
	}
	public void setpImg(String pImg) {
		this.pImg = pImg;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getpNo() {
		return pNo;
	}
	public void setpNo(String pNo) {
		this.pNo = pNo;
	}
	public int getAfNo() {
		return afNo;
	}
	public void setAfNo(int afNo) {
		this.afNo = afNo;
	}
}
