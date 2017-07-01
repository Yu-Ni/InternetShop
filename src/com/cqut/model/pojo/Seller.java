package com.cqut.model.pojo;

public class Seller {

	private String sellerId;
	private String userName;
	private String realName;
	private String password;
	private String bankNumber;
	private String phoneNumber;
	private String address;
	private String id_card;
	
	public Seller() {
		super();
	}
	
	public Seller(String userName, String realName, String password,
			String bankNumber, String phoneNumber, String address,
			String id_card) {
		super();
		this.userName = userName;
		this.realName = realName;
		this.password = password;
		this.bankNumber = bankNumber;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.id_card = id_card;
	}

	public Seller(String sellerId, String userName, String realName,
			String password, String bankNumber, String phoneNumber,
			String address, String id_card) {
		super();
		this.sellerId = sellerId;
		this.userName = userName;
		this.realName = realName;
		this.password = password;
		this.bankNumber = bankNumber;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.id_card = id_card;
	}
	public String getSellerId() {
		return sellerId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getId_card() {
		return id_card;
	}
	public void setId_card(String id_card) {
		this.id_card = id_card;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getBankNumber() {
		return bankNumber;
	}
	public void setBankNumber(String bankNumber) {
		this.bankNumber = bankNumber;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	@Override
	public String toString() {
		return "Seller [sellerId=" + sellerId + ", userName=" + userName
				+ ", realName=" + realName + ", password=" + password
				+ ", bankNumber=" + bankNumber + ", phoneNumber=" + phoneNumber
				+ "]";
	}
	  
}
