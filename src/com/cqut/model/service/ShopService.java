package com.cqut.model.service;

import java.util.List;

import com.cqut.model.pojo.Admin;
import com.cqut.model.pojo.Commodity;
import com.cqut.model.pojo.Shop;


public interface ShopService {	
	public Shop getShopInfo(String SessionUser);

	public void insertInd(Shop shop);
}
