package com.mvc.dto;

public class BidBuyDTO
{
    private int bidBuyNum;
    private int userNum;
    private int productNum;
    private int bidBuyWishPrice;
    private String bidBuyDate;
    private String bidBuyValidDate;
    private String bidBuyState;
    private String imageName;
    private String userSize;
    private int maxBidBuyPrice; //즉시판매가
    private int minBidSellPrice; //즉시구매가
    private String engProduct;
    private int addrNum;
    private String wishPrice;
    private String condition;
    private String styleNum;
    private String immediateBuyPrice;
    private String immediateSellPrice;
    public int getBidBuyNum()
    {
        return bidBuyNum;
    }

    public void setBidBuyNum(int bidBuyNum)
    {
        this.bidBuyNum = bidBuyNum;
    }

    public int getUserNum()
    {
        return userNum;
    }

    public void setUserNum(int userNum)
    {
        this.userNum = userNum;
    }

    public int getProductNum()
    {
        return productNum;
    }

    public void setProductNum(int productNum)
    {
        this.productNum = productNum;
    }

    public int getBidBuyWishPrice()
    {
        return bidBuyWishPrice;
    }

    public void setBidBuyWishPrice(int bidBuyWishPrice)
    {
        this.bidBuyWishPrice = bidBuyWishPrice;
    }

    public String getBidBuyDate()
    {
        return bidBuyDate;
    }

    public void setBidBuyDate(String bidBuyDate)
    {
        this.bidBuyDate = bidBuyDate;
    }

    public String getBidBuyValidDate()
    {
        return bidBuyValidDate;
    }

    public void setBidBuyValidDate(String bidBuyValidDate)
    {
        this.bidBuyValidDate = bidBuyValidDate;
    }

    public String getBidBuyState()
    {
        return bidBuyState;
    }

    public void setBidBuyState(String bidBuyState)
    {
        this.bidBuyState = bidBuyState;
    }

    public String getImageName()
    {
        return imageName;
    }

    public void setImageName(String imageName)
    {
        this.imageName = imageName;
    }

    public String getUserSize()
    {
        return userSize;
    }

    public void setUserSize(String userSize)
    {
        this.userSize = userSize;
    }

    public int getMinBidSellPrice()
    {
        return minBidSellPrice;
    }

    public void setMinBidSellPrice(int minBidSellPrice)
    {
        this.minBidSellPrice = minBidSellPrice;
    }

    public String getEngProduct()
    {
        return engProduct;
    }

    public void setEngProduct(String engProduct)
    {
        this.engProduct = engProduct;
    }

	public int getAddrNum() {
		return addrNum;
	}

	public void setAddrNum(int addrNum) {
		this.addrNum = addrNum;
	}

	public String getWishPrice() {
		return wishPrice;
	}

	public void setWishPrice(String wishPrice) {
		this.wishPrice = wishPrice;
	}

	public int getMaxBidBuyPrice() {
		return maxBidBuyPrice;
	}

	public void setMaxBidBuyPrice(int maxBidBuyPrice) {
		this.maxBidBuyPrice = maxBidBuyPrice;
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
