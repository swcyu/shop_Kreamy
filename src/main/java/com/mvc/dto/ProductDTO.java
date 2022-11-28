package com.mvc.dto;

public class ProductDTO {

	private String imageName;
	private String brandName;
	private String brandImage;
	private String styleNum;
	private String engProduct;
	private int bidBuyCount;
	private int bidSellCount;
	private int tradeCount;
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getBrandImage() {
		return brandImage;
	}
	public void setBrandImage(String brandImage) {
		this.brandImage = brandImage;
	}
	public String getStyleNum() {
		return styleNum;
	}
	public void setStyleNum(String styleNum) {
		this.styleNum = styleNum;
	}
	public String getEngProduct() {
		return engProduct;
	}
	public void setEngProduct(String engProduct) {
		this.engProduct = engProduct;
	}
	public int getBidBuyCount() {
		return bidBuyCount;
	}
	public void setBidBuyCount(int bidBuyCount) {
		this.bidBuyCount = bidBuyCount;
	}
	public int getBidSellCount() {
		return bidSellCount;
	}
	public void setBidSellCount(int bidSellCount) {
		this.bidSellCount = bidSellCount;
	}
	public int getTradeCount() {
		return tradeCount;
	}
	public void setTradeCount(int tradeCount) {
		this.tradeCount = tradeCount;
	}
	
	
}
