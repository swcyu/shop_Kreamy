package com.mvc.dto;

public class TradeDTO
{
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
    private String imageName;
    private String engProduct;
    private String userSize;
    private int maxBidBuyPrice;
    private int minBidSellPrice;
    private String condition;
    private String styleNum;
    private String tradeWonPrice;
    private String immediateBuyPrice;
    private String immediateSellPrice;
    public int getTradeNum()
    {
        return tradeNum;
    }

    public void setTradeNum(int tradeNum)
    {
        this.tradeNum = tradeNum;
    }

    public int getProductNum()
    {
        return productNum;
    }

    public void setProductNum(int productNum)
    {
        this.productNum = productNum;
    }

    public int getSellUserNum()
    {
        return sellUserNum;
    }

    public void setSellUserNum(int sellUserNum)
    {
        this.sellUserNum = sellUserNum;
    }

    public int getBuyUserNum()
    {
        return buyUserNum;
    }

    public void setBuyUserNum(int buyUserNum)
    {
        this.buyUserNum = buyUserNum;
    }

    public int getTradePrice()
    {
        return tradePrice;
    }

    public void setTradePrice(int tradePrice)
    {
        this.tradePrice = tradePrice;
    }

    public String getTradeDate()
    {
        return tradeDate;
    }

    public void setTradeDate(String tradeDate)
    {
        this.tradeDate = tradeDate;
    }

    public String getTradeState()
    {
        return tradeState;
    }

    public void setTradeState(String tradeState)
    {
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

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getEngProduct() {
		return engProduct;
	}

	public void setEngProduct(String engProduct) {
		this.engProduct = engProduct;
	}

	public String getUserSize() {
		return userSize;
	}

	public void setUserSize(String userSize) {
		this.userSize = userSize;
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

	public int getMaxBidBuyPrice() {
		return maxBidBuyPrice;
	}

	public void setMaxBidBuyPrice(int maxBidBuyPrice) {
		this.maxBidBuyPrice = maxBidBuyPrice;
	}

	public int getMinBidSellPrice() {
		return minBidSellPrice;
	}

	public void setMinBidSellPrice(int minBidSellPrice) {
		this.minBidSellPrice = minBidSellPrice;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getStyleNum() {
		return styleNum;
	}

	public void setStyleNum(String styleNum) {
		this.styleNum = styleNum;
	}

	public String getTradeWonPrice() {
		return tradeWonPrice;
	}

	public void setTradeWonPrice(String tradeWonPrice) {
		this.tradeWonPrice = tradeWonPrice;
	}

	public String getImmediateBuyPrice() {
		return immediateBuyPrice;
	}

	public void setImmediateBuyPrice(String immediateBuyPrice) {
		this.immediateBuyPrice = immediateBuyPrice;
	}

	public String getImmediateSellPrice() {
		return immediateSellPrice;
	}

	public void setImmediateSellPrice(String immediateSellPrice) {
		this.immediateSellPrice = immediateSellPrice;
	}

    
}
