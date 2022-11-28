package com.mvc.dto;

public class ProductsDTO {

	private String prodSize; //사이즈
	private Integer immeBuyPrice; //즉시구매가
	private Integer immeSellPrice; //즉시판매가 
	private Integer latestPrice;  //최근 체결가
	private Integer latestPrice2; //2번쨰최근 체결가
	
	public String getProdSize() {
		return prodSize;
	}
	public void setProdSize(String prodSize) {
		this.prodSize = prodSize;
	}
	public Integer getImmeBuyPrice() {
		return immeBuyPrice;
	}
	public void setImmeBuyPrice(Integer immeBuyPrice) {
		this.immeBuyPrice = immeBuyPrice;
	}
	public Integer getImmeSellPrice() {
		return immeSellPrice;
	}
	public void setImmeSellPrice(Integer immeSellPrice) {
		this.immeSellPrice = immeSellPrice;
	}
	public Integer getLatestPrice() {
		return latestPrice;
	}
	public void setLatestPrice(Integer latestPrice) {
		this.latestPrice = latestPrice;
	}
	public Integer getLatestPrice2() {
		return latestPrice2;
	}
	public void setLatestPrice2(Integer latestPrice2) {
		this.latestPrice2 = latestPrice2;
	}
	
	
	
	
	
}
