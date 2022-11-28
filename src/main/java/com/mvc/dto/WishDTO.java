package com.mvc.dto;

public class WishDTO
{

    private int wishNum;
    private int userNum;
    private int productNum;
    private String imageName;
    private String brandImage;
    private String brandName;
    private String engProduct;
    private int minBidSellWishPrice;
    private String minPrice;
    private String userSize;
    
    public int getWishNum()
    {
        return wishNum;
    }

    public void setWishNum(int wishNum)
    {
        this.wishNum = wishNum;
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

    public String getImageName()
    {
        return imageName;
    }

    public void setImageName(String imageName)
    {
        this.imageName = imageName;
    }

    public String getBrandImage()
    {
        return brandImage;
    }

    public void setBrandImage(String brandImage)
    {
        this.brandImage = brandImage;
    }

    public String getEngProduct()
    {
        return engProduct;
    }

    public void setEngProduct(String engProduct)
    {
        this.engProduct = engProduct;
    }

    public int getMinBidSellWishPrice()
    {
        return minBidSellWishPrice;
    }

    public void setMinBidSellWishPrice(int minBidSellWishPrice)
    {
        this.minBidSellWishPrice = minBidSellWishPrice;
    }

    public String getMinPrice()
    {
        return minPrice;
    }

    public void setMinPrice(String minPrice)
    {
        this.minPrice = minPrice;
    }

    public String getUserSize()
    {
        return userSize;
    }

    public void setUserSize(String userSize)
    {
        this.userSize = userSize;
    }

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

}
