package com.mvc.dto;

public class ProductsDTO {

	private String prodSize; //������
	private Integer immeBuyPrice; //��ñ��Ű�
	private Integer immeSellPrice; //����ǸŰ� 
	private Integer latestPrice;  //�ֱ� ü�ᰡ
	private Integer latestPrice2; //2�����ֱ� ü�ᰡ
	
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
