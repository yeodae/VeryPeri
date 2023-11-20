package com.example.project.model;

import lombok.Data;

@Data
public class DeliveryUser {
	private String uId;
	private int duNo;
	private String uDname;
	private String uDaddr;
	private String uDaddrDetail;
	private String zipNo;
	private String fixAddr;
	private String uDphone;
	private String uDmessage;
	private String recipient;
	
	
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
	
	public int getDuNo() {
		return duNo;
	}
	public void setDuNo(int duNo) {
		this.duNo = duNo;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
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
}
