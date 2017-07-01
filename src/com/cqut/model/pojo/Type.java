package com.cqut.model.pojo;

public class Type {
	private String typeid;
	private String typename;
	private String remark;
	public String getTypeid() {
		return typeid;
	}
	public void setTypeid(String typeid) {
		this.typeid = typeid;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Type [typeid=" + typeid + ", typename=" + typename + ", remark=" + remark + "]";
	}
	

}
