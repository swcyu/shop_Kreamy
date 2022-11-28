package com.mvc.dto;

public class BidSellInfoDTO {
	
	private int bidSellNum;
	private int userNum;
	private int productNum;
	private int bidSellWishPrice;
	private String bidSellDate;
	private String bidSellValidDate;
	private int addrNum;
	private int vd;	//sysdate 에 더할꺼 유효 기간떄매	
	
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
	
	public int getBidSellNum() {
		return bidSellNum;
	}
	public void setBidSellNum(int bidSellNum) {
		this.bidSellNum = bidSellNum;
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
	public int getBidSellWishPrice() {
		return bidSellWishPrice;
	}
	public void setBidSellWishPrice(int bidSellWishPrice) {
		this.bidSellWishPrice = bidSellWishPrice;
	}
	public String getBidSellDate() {
		return bidSellDate;
	}
	public void setBidSellDate(String bidSellDate) {
		this.bidSellDate = bidSellDate;
	}
	public String getBidSellValidDate() {
		return bidSellValidDate;
	}
	public void setBidSellValidDate(String bidSellValidDate) {
		this.bidSellValidDate = bidSellValidDate;
	}
	
	
	
}
