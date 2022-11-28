package com.mvc.dto;

public class BidBuyInfoDTO {
	
	private int bidBuyNum;
	private int userNum;
	private int productNum;
	private int bidBuyWishPrice;
	private String bidBuyDate;
	private String bidBuyValidDate;
	private int addrNum;
	private int vd;	//sysdate 에 더할꺼 유효 기간떄매
	private int totPayment;	
	
	public int getTotPayment() {
		return totPayment;
	}
	public void setTotPayment(int totPayment) {
		this.totPayment = totPayment;
	}
	public int getVd() {
		return vd;
	}
	public void setVd(int vd) {
		this.vd = vd;
	}
	public int getAddrNum() {
		return addrNum;
	}
	public void setAddrNum(int addrNum) {
		this.addrNum = addrNum;
	}
	public int getBidBuyNum() {
		return bidBuyNum;
	}
	public void setBidBuyNum(int bidBuyNum) {
		this.bidBuyNum = bidBuyNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public int getBidBuyWishPrice() {
		return bidBuyWishPrice;
	}
	public void setBidBuyWishPrice(int bidBuyWishPrice) {
		this.bidBuyWishPrice = bidBuyWishPrice;
	}
	public String getBidBuyDate() {
		return bidBuyDate;
	}
	public void setBidBuyDate(String bidBuyDate) {
		this.bidBuyDate = bidBuyDate;
	}
	public String getBidBuyValidDate() {
		return bidBuyValidDate;
	}
	public void setBidBuyValidDate(String bidBuyValidDate) {
		this.bidBuyValidDate = bidBuyValidDate;
	}
	
	
	
	
}
