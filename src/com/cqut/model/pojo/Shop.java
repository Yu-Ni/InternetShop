package com.cqut.model.pojo;

import java.util.Date;

public class Shop {

	private String shopid;
	private String sellerId;
	private String shopname;
	private String shopage;

	public String getShopid() {
		return shopid;
	}
	public void setShopid(String shopid) {
		this.shopid = shopid;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public String getShopage() {
		return shopage;
	}
	public void setShopage(String shopage) {
		this.shopage = shopage;
	}
	@Override
	public String toString() {
		return "Shop [shopid=" + shopid + ", sellerId=" + sellerId + ", shopname=" + shopname + ", shopage=" + shopage
				+ "]";
	}
}
