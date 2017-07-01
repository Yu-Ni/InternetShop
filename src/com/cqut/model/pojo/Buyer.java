package com.cqut.model.pojo;

public class Buyer {
	
	private String buyerid;
	private String username;
	private String password;
	private String telphone;
	private int integral;
	private String avatar;
	private int sex;
	
	public Buyer() {
		super();
	}
	
	public Buyer(String username, String password, String telphone,
			int integral, String avatar, int sex) {
		super();
		this.username = username;
		this.password = password;
		this.telphone = telphone;
		this.integral = integral;
		this.avatar = avatar;
		this.sex = sex;
	}

	public Buyer(String buyerid, String username, String password,
			String telphone, int integral, String avatar, int sex) {
		super();
		this.buyerid = buyerid;
		this.username = username;
		this.password = password;
		this.telphone = telphone;
		this.integral = integral;
		this.avatar = avatar;
		this.sex = sex;
	}

	public String getBuyerid() {
		return buyerid;
	}
	public void setBuyerid(String buyerid) {
		this.buyerid = buyerid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public int getIntegral() {
		return integral;
	}
	public void setIntegral(int integral) {
		this.integral = integral;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
}
