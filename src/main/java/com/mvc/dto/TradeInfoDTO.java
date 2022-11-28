package com.mvc.dto;

public class TradeInfoDTO {
	
	private int tradeNum;
	private int productNum;
	private int sellUserNum;
	private int buyUserNum;
	private int tradePrice;
	private String tradeDate;
	private String tradeState;
	private String tradeBuyState;
	private String tradeSellState;
	private int buyAddrNum;
	private int sellAddrNum;
	
	public int getTradeNum() {
		return tradeNum;
	}
	public void setTradeNum(int tradeNum) {
		this.tradeNum = tradeNum;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public int getSellUserNum() {
		return sellUserNum;
	}
	public void setSellUserNum(int sellUserNum) {
		this.sellUserNum = sellUserNum;
	}
	public int getBuyUserNum() {
		return buyUserNum;
	}
	public void setBuyUserNum(int buyUserNum) {
		this.buyUserNum = buyUserNum;
	}
	public int getTradePrice() {
		return tradePrice;
	}
	public void setTradePrice(int tradePrice) {
		this.tradePrice = tradePrice;
	}
	public String getTradeDate() {
		return tradeDate;
	}
	public void setTradeDate(String tradeDate) {
		this.tradeDate = tradeDate;
	}
	public String getTradeState() {
		return tradeState;
	}
	public void setTradeState(String tradeState) {
		this.tradeState = tradeState;
	}
	public String getTradeBuyState() {
		return tradeBuyState;
	}
	public void setTradeBuyState(String tradeBuyState) {
		this.tradeBuyState = tradeBuyState;
	}
	public String getTradeSellState() {
		return tradeSellState;
	}
	public void setTradeSellState(String tradeSellState) {
		this.tradeSellState = tradeSellState;
	}
	public int getBuyAddrNum() {
		return buyAddrNum;
	}
	public void setBuyAddrNum(int buyAddrNum) {
		this.buyAddrNum = buyAddrNum;
	}
	public int getSellAddrNum() {
		return sellAddrNum;
	}
	public void setSellAddrNum(int sellAddrNum) {
		this.sellAddrNum = sellAddrNum;
	}
	
	
}
