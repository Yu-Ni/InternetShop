package com.cqut.model.pojo;

public class UserInfo {
	
	private String userid;
	private String username;
	private String password;
	private String realname;
	
	public UserInfo() {
		super();
	}

	public UserInfo(String username, String password, String realname) {
		super();
		this.username = username;
		this.password = password;
		this.realname = realname;
	}
	
	public UserInfo(String userid, String username, String password,
			String realname) {
		super();
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.realname = realname;
	}

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	
	@Override
	public String toString() {
		return "UserInfo [userid=" + userid + ", username=" + username
				+ ", password=" + password + ", realname=" + realname + "]";
	}
	
	

}
