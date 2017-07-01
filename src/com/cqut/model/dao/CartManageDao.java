package com.cqut.model.dao;

import org.springframework.stereotype.Repository;

import com.cqut.model.pojo.Cart;
import com.cqut.model.pojo.Order;

@Repository
public interface CartManageDao {
	
	public int insert(Cart cart);
	public int addOrderByCart(Order order);
	public int deleteCart(String cartid);
	public int updateProductMargin(String amount,String productid);
}
