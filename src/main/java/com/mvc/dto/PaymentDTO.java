package com.mvc.dto;

public class PaymentDTO {
	private int payNum;
	private int userNum;
	private String cardNum;
	private String validMonth;
	private String validYear;
	private String birthDate;
	private String bank;
	private String payBasic;
	
	public int getPayNum() {
		return payNum;
	}
	public void setPayNum(int payNum) {
		this.payNum = payNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getCardNum() {
		return cardNum;
	}
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	public String getValidMonth() {
		return validMonth;
	}
	public void setValidMonth(String validMonth) {
		this.validMonth = validMonth;
	}
	public String getValidYear() {
		return validYear;
	}
	public void setValidYear(String validYear) {
		this.validYear = validYear;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getPayBasic() {
		return payBasic;
	}
	public void setPayBasic(String payBasic) {
		this.payBasic = payBasic;
	}
	
	
}
