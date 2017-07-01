package com.cqut.model.pojo;

import java.util.Date;

public class Evaluation {

	private String evaluationid;
	private String orderid;
	private String time;
	private String content;
	private String buyerid;
	public Evaluation(String evaluationid, String orderid, String time, String content, String buyerid) {
		super();
		this.evaluationid = evaluationid;
		this.orderid = orderid;
		this.time = time;
		this.content = content;
		this.buyerid = buyerid;
	}
	public Evaluation() {
		super();
	}
	public Evaluation(String orderid, String time, String content, String buyerid) {
		super();
		this.orderid = orderid;
		this.time = time;
		this.content = content;
		this.buyerid = buyerid;
	}
	public String getEvaluationid() {
		return evaluationid;
	}
	public void setEvaluationid(String evaluationid) {
		this.evaluationid = evaluationid;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBuyerid() {
		return buyerid;
	}
	public void setBuyerid(String buyerid) {
		this.buyerid = buyerid;
	}
	
}
