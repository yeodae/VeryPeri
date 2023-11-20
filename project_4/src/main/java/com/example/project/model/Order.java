package com.example.project.model;

import lombok.Data;

@Data
public class Order {
	
	private String buyNo;
	private String oNo;
	private String pNo;
	private String uId;
	private String payment;
	private String oDate;
	private int oCount;
	private char exchange;
	private int oPoint;
	private String oMessage;
	private int afNo;
	private int orderCnt;
	private int cnt;
	private String uName;
	
	//배송 JOIN
	private String dDate;
	private String dState;
	
//	상품 JOIN 	
	private String pName;
	private String price;
	private String artist;
	private String pImg;
	private String path;
	
	//배송정보 JOIN
	private int duNo;
	private String uDname;
	private String uDaddr;
	private String uDaddrDetail;
	private String zipNo;
	private String fixAddr;
	private String uDphone;
	private String uDmessage;
	private String uPhone;
	
	
	
	
	
	public String getuPhone() {
		return uPhone;
	}
	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getBuyNo() {
		return buyNo;
	}
	public void setBuyNo(String buyNo) {
		this.buyNo = buyNo;
	}
	public int getDuNo() {
		return duNo;
	}
	public void setDuNo(int duNo) {
		this.duNo = duNo;
	}
	public String getuDname() {
		return uDname;
	}
	public void setuDname(String uDname) {
		this.uDname = uDname;
	}
	public String getuDaddr() {
		return uDaddr;
	}
	public void setuDaddr(String uDaddr) {
		this.uDaddr = uDaddr;
	}
	public String getuDaddrDetail() {
		return uDaddrDetail;
	}
	public void setuDaddrDetail(String uDaddrDetail) {
		this.uDaddrDetail = uDaddrDetail;
	}
	public String getZipNo() {
		return zipNo;
	}
	public void setZipNo(String zipNo) {
		this.zipNo = zipNo;
	}
	public String getFixAddr() {
		return fixAddr;
	}
	public void setFixAddr(String fixAddr) {
		this.fixAddr = fixAddr;
	}
	public String getuDphone() {
		return uDphone;
	}
	public void setuDphone(String uDphone) {
		this.uDphone = uDphone;
	}
	public String getuDmessage() {
		return uDmessage;
	}
	public void setuDmessage(String uDmessage) {
		this.uDmessage = uDmessage;
	}
	public String getdDate() {
		return dDate;
	}
	public void setdDate(String dDate) {
		this.dDate = dDate;
	}
	public String getdState() {
		return dState;
	}
	public void setdState(String dState) {
		this.dState = dState;
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getoNo() {
		return oNo;
	}
	public void setoNo(String oNo) {
		this.oNo = oNo;
	}
	
	public String getpNo() {
		return pNo;
	}
	public void setpNo(String pNo) {
		this.pNo = pNo;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getoDate() {
		return oDate;
	}
	public void setoDate(String oDate) {
		this.oDate = oDate;
	}
	public int getoCount() {
		return oCount;
	}
	public void setoCount(int oCount) {
		this.oCount = oCount;
	}
	public char getExchange() {
		return exchange;
	}
	public void setExchange(char exchange) {
		this.exchange = exchange;
	}
	public int getoPoint() {
		return oPoint;
	}
	public void setoPoint(int oPoint) {
		this.oPoint = oPoint;
	}
	public String getoMessage() {
		return oMessage;
	}
	public void setoMessage(String oMessage) {
		this.oMessage = oMessage;
	}
	public int getAfNo() {
		return afNo;
	}
	public void setAfNo(int afNo) {
		this.afNo = afNo;
	}
	public int getOrderCnt() {
		return orderCnt;
	}
	public void setOrderCnt(int orderCnt) {
		this.orderCnt = orderCnt;
	}
	
	
	
	
	
}
