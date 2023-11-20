package com.example.project.model;

import lombok.Data;

@Data
public class User {
	//고객(유저)
	private String uId;
	private String uPw;
	private String uPhone;
	private String uName;
	private String uName2;
	private String uEmail;
	private char uEventyn;
	private int uCnt;
	private int uPoint;
	private String joindate;
	private String gArtist;
	private String bYn;
	private String bReasons;
	private String bDate;
	private String profile;
	
	//딜리버리 테이블
	private int duNo;
	private String uDname;
	private String uDaddr;
	private String uDaddrDetail;
	private String zipNo;
	private String fixAddr;
	private String uDphone;
	private String uDmessage;
	private String recipient;
	
	private String oNo;
	private String dDate;
	private String dState;
	private int afNo;
	private char exchange;
	private int buyNo;
	private String path;
	private int oCount;
	
	
	
	//포인트 테이블
	private int point;
	private int usepoint;
	private int repoint;
	private String podata;
	private String pName;
	private String dateFormat;
	
	
	
	
	
	public String getDateFormat() {
		return dateFormat;
	}
	public void setDateFormat(String dateFormat) {
		this.dateFormat = dateFormat;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getuId() {
		return uId;
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
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getoNo() {
		return oNo;
	}
	public void setoNo(String oNo) {
		this.oNo = oNo;
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
	public int getAfNo() {
		return afNo;
	}
	public void setAfNo(int afNo) {
		this.afNo = afNo;
	}
	public char getExchange() {
		return exchange;
	}
	public void setExchange(char exchange) {
		this.exchange = exchange;
	}
	public int getBuyNo() {
		return buyNo;
	}
	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getoCount() {
		return oCount;
	}
	public void setoCount(int oCount) {
		this.oCount = oCount;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuPw() {
		return uPw;
	}
	public void setuPw(String uPw) {
		this.uPw = uPw;
	}
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
	public String getuName2() {
		return uName2;
	}
	public void setuName2(String uName2) {
		this.uName2 = uName2;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	public char getuEventyn() {
		return uEventyn;
	}
	public void setuEventyn(char uEventyn) {
		this.uEventyn = uEventyn;
	}
	public int getuCnt() {
		return uCnt;
	}
	public void setuCnt(int uCnt) {
		this.uCnt = uCnt;
	}
	public int getuPoint() {
		return uPoint;
	}
	public void setuPoint(int uPoint) {
		this.uPoint = uPoint;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getgArtist() {
		return gArtist;
	}
	public void setgArtist(String gArtist) {
		this.gArtist = gArtist;
	}
	public String getbYn() {
		return bYn;
	}
	public void setbYn(String bYn) {
		this.bYn = bYn;
	}
	public String getbReasons() {
		return bReasons;
	}
	public void setbReasons(String bReasons) {
		this.bReasons = bReasons;
	}
	public String getbDate() {
		return bDate;
	}
	public void setbDate(String bDate) {
		this.bDate = bDate;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getUsepoint() {
		return usepoint;
	}
	public void setUsepoint(int usepoint) {
		this.usepoint = usepoint;
	}
	public int getRepoint() {
		return repoint;
	}
	public void setRepoint(int repoint) {
		this.repoint = repoint;
	}
	public String getPodata() {
		return podata;
	}
	public void setPodata(String podata) {
		this.podata = podata;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	
	
	
	
}
