package com.cqut.model.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cqut.model.dao.SearchDao;
import com.cqut.model.dao.SellerDao;
import com.cqut.model.pojo.Seller;
import com.cqut.model.service.SellManagerService;
import com.cqut.util.MD5;
import com.cqut.util.UID;

@Service
public class SellManagerServiceImpl implements SellManagerService {
	@Autowired
	SellerDao sellerDao; 
	
	@Autowired
	SearchDao searchDao; 
	
	@Override
	public void insert(Seller seller) {
		seller.setSellerId(UID.createID());
		seller.setPassword(MD5.getMD5(seller.getPassword()));
		sellerDao.insert(seller);
		
	}

	@Override
	public void update(Seller seller) {
		seller.setPassword(MD5.getMD5(seller.getPassword()));
		sellerDao.update(seller);
		
	}

	@Override
	public List<Seller> getSellerByCondition(String condition) {
		return sellerDao.getSellerByCondition(condition);
	}

	@Override
	public void delete(String sellerIds) {
		sellerDao.delete(sellerIds);
	}

	@Override
	public String getSellerList(String condition) {
		return null;
	}

	@Override
	public List<Map<String, Object>> getProductByType(String searInput) {
		String[] properties={"t_commodity.productid, "
				+ "t_commodity.productname, "
				+ "t_commodity.productmargin, "
				+ "t_commodity.price, "
				+ "t_commodity.img, "
				+ "t_commodity.description, "
				+ "t_commodity.shopid, "
				+ "t_shop.shopname, "
				+ "t_commodity.typeid, "
				+ "t_type.typename, "
				+ "t_commodity.remark"};
		String baseEntity = "t_commodity";
		String joinEntity = " LEFT JOIN t_shop ON t_shop.shopid = t_commodity.shopid "
				+ "LEFT JOIN t_type ON t_type.typeid = t_commodity.typeid ";
		String condition = " 1=1 and t_commodity.productname like '%"+searInput+"%' ";
		condition += " order by t_commodity.typeid ";
		List<Map<String, Object>> list=searchDao.searchForeign(properties,baseEntity,joinEntity,null,null,condition);
		List<Map<String, Object>> typeList = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> productList = new ArrayList<Map<String,Object>>();
		Map<String, Object> typeMap = new HashMap<String,Object>();
		Map<String, Object> productMap =null;
		
		if(list.size()>0){
			int index = 0;
			String type_id = list.get(0).get("typeid").toString();
			for(Map<String,Object> map : list){
				productMap = new HashMap<String,Object>();
				String typeid = map.get("typeid").toString();
				if(!typeid.equals(type_id)){
					typeMap.put("product",productList);
					typeList.add(typeMap);
					typeMap = new HashMap<String,Object>();
					productList = new ArrayList<Map<String,Object>>();
					type_id = typeid;
				}
				
				productMap.put("productId",map.get("productid").toString());
				productMap.put("productName",map.get("productname").toString());
				productMap.put("productMargin",map.get("productmargin").toString());
				productMap.put("price",map.get("price").toString());
				productMap.put("img",map.get("img").toString());
				
				if(map.containsKey("description")){
					productMap.put("description",map.get("description").toString());
				}else{
					productMap.put("description","");
				}
				
				if(map.containsKey("shopid")){
					productMap.put("shopId",map.get("shopid").toString());
					productMap.put("shopname",map.get("shopname").toString());
				}else{
					productMap.put("shopId","");
					productMap.put("shopname","");
				}
				
				if(map.containsKey("remark")){
					productMap.put("remark",map.get("remark").toString());
				}else{
					productMap.put("remark","");
				}
				productList.add(productMap);
				
				typeMap.put("typeId",map.get("typeid").toString());
				typeMap.put("typename",map.get("typename").toString());
				
				if(index==list.size()-1){
					typeMap.put("product",productList);
					typeList.add(typeMap);
				}
				
				index++;
				
			}
		}
		
		return typeList;
	}




}
