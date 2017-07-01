package com.cqut.model.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import oracle.sql.DATE;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqut.model.dao.CommodityDao;
import com.cqut.model.dao.SearchDao;
import com.cqut.model.pojo.Commodity;
import com.cqut.model.pojo.Type;
import com.cqut.model.service.CommodityService;
import com.cqut.util.UID;


@Service
public class CommodityServiceImpl implements CommodityService {

	@Autowired
	CommodityDao commodityDao; 
	
	@Autowired
	SearchDao searchDao;
	
	@Override
	public void insert(Commodity commodity) {
		 
		Calendar a=Calendar.getInstance();
		String id= UID.createID();
		String productId = "P"+a.get(Calendar.YEAR)+id;
		commodity.setProductId(productId); 
		commodityDao.insert(commodity);
		
	}

	@Override
	public void delete(String productIds) {
		commodityDao.delete(productIds);
	}

	@Override
	public void update(Commodity commodity) {
		 commodityDao.update(commodity);
		
	}

	@Override
	public Commodity getCommodityById(String productId) {
		return commodityDao.getCommodityById(productId);
	}

	@Override
	public List<Map<String,Object>> getCommodityByCondition(String sellerId) {
		String[] property = {
				"description, "
				+ "img, "
				+ "price, "
				+ "productId, "
				+ "productMargin, "
				+ "productName, "
				+ "remark, "
				+ "t_commodity.shopId, "
				+ "typeId"
		};
		String joinEntity = " LEFT JOIN t_shop ON t_shop.shopid = t_commodity.shopid ";
		String condition = " t_shop.sellerId="+sellerId;
		List<Map<String,Object>> list=searchDao.searchForeign(property, " t_commodity ", joinEntity, null, null, condition);
		return list;
	}

	@Override
	public List<Map<String,Object>> getAllGoodType() {
		String[] property = {
				"*"
		};
		return  searchDao.searchForeign(property, " t_type ", null, null, null, null);
	}

}
