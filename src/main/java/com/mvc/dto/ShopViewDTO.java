package com.mvc.dto;

public class ShopViewDTO {

	
	private String engProduct;
	private String brandName;
	private String category;
	private String retailPrice;
	private String imageName;
	private String brandImage;
	private String releasedate;
	private int prodNum;
	
	private int checkNum;
	
	
	
	public int getCheckNum() {
		return checkNum;
	}
	public void setCheckNum(int checkNum) {
		this.checkNum = checkNum;
	}
	private String shopPrice;
	
	public String getShopPrice() {
		return shopPrice;
	}
	public void setShopPrice(String shopPrice) {
		this.shopPrice = shopPrice;
	}
	
	
	
	
	public int getProdNum() {
		return prodNum;
	}
	public void setProdNum(int prodNum) {
		this.prodNum = prodNum;
	}
	public String getReleasedate() {
		return releasedate;
	}
	public void setReleasedate(String releasedate) {
		this.releasedate = releasedate;
	}
	public String getEngProduct() {
		return engProduct;
	}
	public void setEngProduct(String engProduct) {
		this.engProduct = engProduct;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getRetailPrice() {
		return retailPrice;
	}
	public void setRetailPrice(String retailPrice) {
		this.retailPrice = retailPrice;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public String getBrandImage() {
		return brandImage;
	}
	public void setBrandImage(String brandImage) {
		this.brandImage = brandImage;
	}
	
	
	
	
}
