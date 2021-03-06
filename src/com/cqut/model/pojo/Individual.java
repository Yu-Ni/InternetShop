package com.cqut.model.pojo;

public class Individual {
	
	private String sellerId;
	private String username;
	private String realname;
	private String banknumber;
	private String phonenumber;
	private String address;
	private String id_card;
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getBanknumber() {
		return banknumber;
	}
	public void setBanknumber(String banknumber) {
		this.banknumber = banknumber;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
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
	@Override
	public String toString() {
		return "Individual [sellerId=" + sellerId + ", username=" + username
				+ ", realname=" + realname + ", banknumber=" + banknumber
				+ ", phonenumber=" + phonenumber + ", address=" + address
				+ ", id_card=" + id_card + "]";
	}
	public Individual(String sellerId, String username, String realname,
			String banknumber, String phonenumber, String address,
			String id_card) {
		super();
		this.sellerId = sellerId;
		this.username = username;
		this.realname = realname;
		this.banknumber = banknumber;
		this.phonenumber = phonenumber;
		this.address = address;
		this.id_card = id_card;
	}
	public Individual() {
		super();
	}
	
}
