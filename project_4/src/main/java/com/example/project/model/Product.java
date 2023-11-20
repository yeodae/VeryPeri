package com.example.project.model;

import lombok.Data;

@Data
public class Product {
	
	private String pNo;
	private String pName;
	private int price;
	private int stock;
	private char membership;
	private String pDate;
	private int pLimit;
	private String category;
	private String artist;
	private String reservation;//예약 상품 여부
	private String fNo; //특전 조인용
	private String dState;
	
	private int cnt;
	private int point;
	private char soldout;
	private String fYn;
	private int afNo;
	private String pImg;
	private String path;
	private char exchange;
	private String imgType;
	 
	// order 구매내역 조인용
	private String oNo;
	private String oDate;
	private int quantity;
	private int buyNo;
	private int oCount;
	private String uName;
	private String uPhone;
	
	//배송정보
	private int duNo;
	private String uDname;
	private String uDaddr;
	private String uDaddrDetail;
	private String zipNo;
	private String fixAddr;
	private String uDphone;
	private String uDmessage;
	//멤버쉽
	private int mNo;
	private char mStatus;
	private String mRegDate;
	private String mExpDate;
	private String uId;
	private String mArtist;
	private char kitYn;
		
	//총결제금
	private int paymentSum;
		
		
		
		public int getPaymentSum() {
			return paymentSum;
		}
		public void setPaymentSum(int paymentSum) {
			this.paymentSum = paymentSum;
		}
	
	//user 테이블 조인
		private String uMembership;
		
	public int getmNo() {
			return mNo;
		}
		public void setmNo(int mNo) {
			this.mNo = mNo;
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
		public String getmArtist() {
			return mArtist;
		}
		public void setmArtist(String mArtist) {
			this.mArtist = mArtist;
		}
		public char getKitYn() {
			return kitYn;
		}
		public void setKitYn(char kitYn) {
			this.kitYn = kitYn;
		}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
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
	public int getoCount() {
		return oCount;
	}
	public void setoCount(int oCount) {
		this.oCount = oCount;
	}
	public int getBuyNo() {
		return buyNo;
	}
	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
	}
	public char getExchange() {
		return exchange;
	}
	public void setExchange(char exchange) {
		this.exchange = exchange;
	}
	public String getReservation() {
		return reservation;
	}
	public void setReservation(String reservation) {
		this.reservation = reservation;
	}
	public String getfNo() {
		return fNo;
	}
	public void setfNo(String fNo) {
		this.fNo = fNo;
	}
	public String getdState() {
		return dState;
	}
	public void setdState(String dState) {
		this.dState = dState;
	}
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
	public String getuMembership() {
		return uMembership;
	}
	public void setuMembership(String uMembership) {
		this.uMembership = uMembership;
	}
	public String getImgType() {
		return imgType;
	}
	public void setImgType(String imgType) {
		this.imgType = imgType;
	}
	
	

	
}
