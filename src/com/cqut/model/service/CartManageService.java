package com.cqut.model.service;

import java.util.List;
import java.util.Map;

import com.cqut.model.pojo.Cart;

public interface CartManageService {
	public List<Map<String,Object>> getCartList(String username,String goodType,String searchContent);
	public int addOrderByCart(String cartid,String username);
	public int deleteCart(String cartid);
	public int addOrderByCartShop(String shopid,String username);
	public int deleteCartShop(String username,String shopid);
	public int addCart(Cart cart);
}
