package com.example.project.model;

import lombok.Data;

@Data
public class Payment {
	
	private String pNo;
	private String pName;
	private int price;
	private int stock;
	private char membership;
	private String pDate;
	private int pLimit;
	private String category;
	private String artist;
	private String fNo; //특전 조인용
	private String kitYn; //키트여부
	
	//오더테이블
	private int buyNo;
	
	private int point;
	private char soldout;
	private String fYn;
	private int afNo;
	private String pImg;
	private String path;
	 
	// order 구매내역 조인용
	private String oNo;
	private String oDate;
	private int quantity;
	
	
	//배송 주소록 테이블 
	private String uDmessage;
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getoNo() {
		return oNo;
	}
	public void setoNo(String oNo) {
		this.oNo = oNo;
	}
	public String getoDate() {
		return oDate;
	}
	public void setoDate(String oDate) {
		this.oDate = oDate;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getpImg() {
		return pImg;
	}
	public void setpImg(String pImg) {
		this.pImg = pImg;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpNo() {
		return pNo;
	}
	public void setpNo(String pNo) {
		this.pNo = pNo;
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
	public int getAfNo() {
		return afNo;
	}
	public void setAfNo(int afNo) {
		this.afNo = afNo;
	}
	public String getfNo() {
		return fNo;
	}
	public void setfNo(String fNo) {
		this.fNo = fNo;
	}
	public String getKitYn() {
		return kitYn;
	}
	public void setKitYn(String kitYn) {
		this.kitYn = kitYn;
	}
	public String getuDmessage() {
		return uDmessage;
	}
	public void setuDmessage(String uDmessage) {
		this.uDmessage = uDmessage;
	}
	public int getBuyNo() {
		return buyNo;
	}
	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
	}
	
	

	
}
