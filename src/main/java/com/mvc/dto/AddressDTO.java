package com.mvc.dto;

public class AddressDTO {
	
	public int addrNum;
	public int userNum;
	public String recvName;
	public String recvPhone;
	public String postNum;
	public String addr1;
	public String addr2;
	public String addrBasic;//디폴트는 false
	
	public int getAddrNum() {
		return addrNum;
	}
	public void setAddrNum(int addrNum) {
		this.addrNum = addrNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getRecvName() {
		return recvName;
	}
	public void setRecvName(String recvName) {
		this.recvName = recvName;
	}
	public String getRecvPhone() {
		return recvPhone;
	}
	public void setRecvPhone(String recvPhone) {
		this.recvPhone = recvPhone;
	}
	public String getPostNum() {
		return postNum;
	}
	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddrBasic() {
		return addrBasic;
	}
	public void setAddrBasic(String addrBasic) {
		this.addrBasic = addrBasic;
	}
	
}
