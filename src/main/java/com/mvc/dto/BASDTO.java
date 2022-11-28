package com.mvc.dto;

public class BASDTO
{
	private int BASNum;
    private String imageName;
    private String engProduct;
    private String size;
    private String state;
    private String wishPrice;
    private String validDate;
    private String mode;
    
    
    public int getBASNum() {
		return BASNum;
	}

	public void setBASNum(int bASNum) {
		BASNum = bASNum;
	}

	public String getImageName()
    {
        return imageName;
    }

    public void setImageName(String imageName)
    {
        this.imageName = imageName;
    }

    public String getEngProduct()
    {
        return engProduct;
    }

    public void setEngProduct(String engProduct)
    {
        this.engProduct = engProduct;
    }

    public String getSize()
    {
        return size;
    }

    public void setSize(String size)
    {
        this.size = size;
    }

    public String getState()
    {
        return state;
    }

    public void setState(String state)
    {
        this.state = state;
    }

	public String getWishPrice() {
		return wishPrice;
	}

	public void setWishPrice(String wishPrice) {
		this.wishPrice = wishPrice;
	}

	public String getValidDate() {
		return validDate;
	}

	public void setValidDate(String validDate) {
		this.validDate = validDate;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}
    

}
