package com.cqut.model.pojo;

public class Commodity {

	private String productId;
	private String shopId;
	private String productName;
	private String typeId;
	private int productMargin;
	private double price;
	private String img;
	private String remark;
	private String description;
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	 
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductMargin() {
		return productMargin;
	}
	public void setProductMargin(int productMargin) {
		this.productMargin = productMargin;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	 
	public String getTypeId() {
		return typeId;
	}
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	
	 
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "Commodity [productId=" + productId + ", cartId=" + shopId
				+ ", productName=" + productName + ", productMargin="
				+ productMargin + ", price=" + price + ", img=" + img + "]";
	}
	
}
