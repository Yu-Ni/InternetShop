package com.cqut.model.service.impl;

import java.util.Calendar;
import java.util.List;



import java.util.UUID;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqut.model.dao.AdminDao;
import com.cqut.model.dao.BuyerDao;
import com.cqut.model.dao.CommodityDao;
import com.cqut.model.dao.ShopDao;
import com.cqut.model.pojo.Admin;
import com.cqut.model.pojo.Shop;
import com.cqut.model.service.AdminManageService;
import com.cqut.model.service.ShopService;
import com.cqut.util.UID;

@Service
public class ShopServiceImpl implements ShopService {
	@Autowired
	private ShopDao dao;

	@Override
	public Shop getShopInfo(String SessionUser) {
		return dao.getShopInfo(SessionUser);
	}

	@Override
	public void insertInd(Shop shop) {		
		dao.insertInd(shop);	
	}


	
	
}
