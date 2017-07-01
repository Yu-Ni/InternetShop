package com.cqut.model.service;

import java.util.List;
import java.util.Map;

import com.cqut.model.pojo.Order;

public interface OrderService {

	
	public List<Map<String,Object>> getOrderByUserId(String userId);
	public String createOrderOne(Order order);
	public int delete(String orderId);
	public List<Map<String,Object>> getOrderByCondition(String userId,String condition);

}
