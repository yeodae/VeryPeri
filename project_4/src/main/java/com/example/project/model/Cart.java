package com.example.project.model;

public class Cart {
	
	private String uId;
	private int cNo;
	private String pNo;
	private int cnt;
	
	//제품 테이블 조인
	private String pName;
	private int price;
	private int stock;
	private int pLimit;//최대 구매 가능 갯수
	private char membership;
	private String pDate;
	private String category;
	private String artist;
	private String reservation;//예약 상품 여부
	private String fNo; //특전 조인용
	
	//사진 테이블 조인
	private String path;

	//멤버쉽
		private int mNo;
		private char mStatus;
		private String mRegDate;
		private String mExpDate;
		private String mArtist;
		private char kitYn;
	
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

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getpNo() {
		return pNo;
	}

	public void setpNo(String pNo) {
		this.pNo = pNo;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getpLimit() {
		return pLimit;
	}

	public void setpLimit(int pLimit) {
		this.pLimit = pLimit;
	}

	public char getMembership() {
		return membership;
	}

	public void setMembership(char membership) {
		this.membership = membership;
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

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
}