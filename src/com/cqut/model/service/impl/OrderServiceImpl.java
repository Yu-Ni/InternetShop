package com.cqut.model.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.UUID;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqut.model.dao.OrderDao;
import com.cqut.model.dao.SearchDao;
import com.cqut.model.pojo.Order;
import com.cqut.model.service.OrderService;
import com.cqut.util.UID;
import com.google.gson.JsonArray;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	SearchDao searchDao;
	
	@Autowired
    OrderDao orderDao;
	
	@Override
	public List<Map<String,Object>> getOrderByUserId(String userId) {
		 
		
		String[] properties ={"t_order.orderid, t_order.price AS totalPrice, "
				+ "t_order.createtime AS createtime, "
				+ "t_orderdetail.price AS itemPrice, "
				+ "t_orderdetail.orderdetailid AS orderdetailid,"
				+ "t_orderdetail.number AS number, "
				+ "t_commodity.productname AS productname, "
				+ "t_commodity.img AS img, "
				+ "t_commodity.productid AS productid, "
				+ "t_commodity.price AS productprice, "
				+ "t_shop.shopname AS shopname"
		};
		
		String baseEntity = "t_order";
		String joinEntity = "LEFT JOIN t_orderdetail ON t_order.orderid = t_orderdetail.orderid "
				+ " LEFT JOIN t_commodity ON t_commodity.productid = t_orderdetail.productid "
				+ " LEFT JOIN t_shop ON t_shop.shopid = t_order.shopid ";
		String condition  = " 1 = 1";
		if(userId != null && !userId.isEmpty()){
			condition+= " AND t_order.buyerid = '"+userId+"'";
		}
		
		condition+=" ORDER BY t_order.orderid";
		
		List<Map<String,Object>> list = searchDao.searchForeign(
				properties, baseEntity, joinEntity, 
				null, 
				null, 
				condition);
		
		List<Map<String,Object>> orderList = new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> detailList = new ArrayList<Map<String,Object>>();
		Map<String,Object> orderMap = new HashMap<String,Object>();
		Map<String,Object> detailMap = null;
		
		if(list.size()>0){
			int index = 0;
			String orderId = list.get(0).get("orderid").toString();
			for(Map<String,Object> map : list){
				detailMap = new HashMap<String,Object>();
				String ORDERID = map.get("orderid").toString();
				if(!orderId.equals(ORDERID)){
					orderMap.put("details", detailList);
					orderList.add(orderMap);
					orderMap = new HashMap<String,Object>();
					detailList = new ArrayList<Map<String,Object>>();
					orderId = ORDERID;
				}
				
				if(map.containsKey("itemPrice") )
				{
					detailMap.put("itemPrice", map.get("itemPrice").toString());
				}else{
					detailMap.put("itemPrice","");
				}
				if(map.containsKey("orderdetailid") )
				{
					detailMap.put("orderdetailid", map.get("orderdetailid").toString());
				}else{
					detailMap.put("orderdetailid","");
				}
 				if(map.containsKey("productname")){
					detailMap.put("productname", map.get("productname").toString());
				}else{
					detailMap.put("productname", "");
				}
				if(map.containsKey("productid")){
					detailMap.put("productid", map.get("productid").toString());
				}else{
					detailMap.put("productid", "");
				}
				if(map.containsKey("productprice")){
					detailMap.put("productprice", map.get("productprice").toString());
				}else{
					detailMap.put("productprice", "");
				}
				if(map.containsKey("img")){
					detailMap.put("img", map.get("img").toString());
				}else{
					detailMap.put("img", "");
				}
				detailMap.put("number", map.get("number").toString());

				detailList.add(detailMap);
				
				orderMap.put("orderid", map.get("orderid").toString());
				orderMap.put("totalPrice", map.get("totalPrice").toString());
				orderMap.put("createtime", map.get("createtime").toString());
				orderMap.put("shopname", map.get("shopname").toString());

				if(index == list.size()-1){
					orderMap.put("details", detailList);
					orderList.add(orderMap);
				} 
				index++;
				
			}
		}
		
		return orderList;
		
	}

	@Override
	public String createOrderOne(Order order) {
		
		Calendar a=Calendar.getInstance();
 
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		 Date time=null;
		try {
		   time= sdf.parse(sdf.format(new Date()));

		} catch (ParseException e) {

		   e.printStackTrace();
		}
		
		String id= UID.createID();
		 
		order.setOrderId(id); 
		order.setCreateTime(time);
		
		 try {
			 orderDao.insert(order);
			 return order.getOrderId();
		} catch (Exception e) {
			 return "0";
		}
		 
	}

	@Override
	public int delete(String orderId) {
		 
		return orderDao.delete(orderId);
		
	}

	@Override
	public List<Map<String, Object>> getOrderByCondition(String userId,
			String condition) { 
		String[] properties ={"t_order.orderid, t_order.price AS totalPrice, "
				+ "t_order.createtime AS createtime, "
				+ "t_orderdetail.price AS itemPrice, "
				+ "t_orderdetail.orderdetailid AS orderdetailid,"
				+ "t_orderdetail.number AS number, "
				+ "t_orderdetail.status AS status, "

				+ "t_commodity.productname AS productname, "
				+ "t_commodity.img AS img, "
				+ "t_commodity.productid AS productid, "
				+ "t_commodity.price AS productprice, "
				+ "t_shop.shopname AS shopname"
		};
		
		String baseEntity = "t_order";
		String joinEntity = "LEFT JOIN t_orderdetail ON t_order.orderid = t_orderdetail.orderid "
				+ " LEFT JOIN t_commodity ON t_commodity.productid = t_orderdetail.productid "
				+ " LEFT JOIN t_shop ON t_shop.shopid = t_order.shopid ";
		String conditionsql  = " 1 = 1";
		if(userId != null && !userId.isEmpty()){
			conditionsql+= " AND t_order.buyerid = '"+userId+"' AND t_commodity.productname like '%"+condition+"%'";
		}
		conditionsql+=" ORDER BY t_order.orderid";
		
		List<Map<String,Object>> list = searchDao.searchForeign(
				properties, baseEntity, joinEntity, 
				null, 
				null, 
				conditionsql);
		
		List<Map<String,Object>> orderList = new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> detailList = new ArrayList<Map<String,Object>>();
		Map<String,Object> orderMap = new HashMap<String,Object>();
		Map<String,Object> detailMap = null;
		
		if(list.size()>0){
			int index = 0;
			String orderId = list.get(0).get("orderid").toString();
			for(Map<String,Object> map : list){
				detailMap = new HashMap<String,Object>();
				String ORDERID = map.get("orderid").toString();
				if(!orderId.equals(ORDERID)){
					orderMap.put("details", detailList);
					orderList.add(orderMap);
					orderMap = new HashMap<String,Object>();
					detailList = new ArrayList<Map<String,Object>>();
					orderId = ORDERID;
				}
				
				if(map.containsKey("itemPrice") )
				{
					detailMap.put("itemPrice", map.get("itemPrice").toString());
				}else{
					detailMap.put("itemPrice","");
				}
				if(map.containsKey("orderdetailid") )
				{
					detailMap.put("orderdetailid", map.get("orderdetailid").toString());
				}else{
					detailMap.put("orderdetailid","");
				}
 				if(map.containsKey("productname")){
					detailMap.put("productname", map.get("productname").toString());
				}else{
					detailMap.put("productname", "");
				}
				if(map.containsKey("productid")){
					detailMap.put("productid", map.get("productid").toString());
				}else{
					detailMap.put("productid", "");
				}
				if(map.containsKey("productprice")){
					detailMap.put("productprice", map.get("productprice").toString());
				}else{
					detailMap.put("productprice", "");
				}
				if(map.containsKey("img")){
					detailMap.put("img", map.get("img").toString());
				}else{
					detailMap.put("img", "");
				}
				if(map.containsKey("number")){
					detailMap.put("number", map.get("number").toString());
				}else{
					detailMap.put("number", "");
				}
				if(map.containsKey("status")){
					detailMap.put("status", map.get("status").toString());
				}else{
					detailMap.put("status", "");
				} 
				detailList.add(detailMap);
				
				orderMap.put("orderid", map.get("orderid").toString());
				orderMap.put("totalPrice", map.get("totalPrice").toString());
				orderMap.put("createtime", map.get("createtime").toString());
				orderMap.put("shopname", map.get("shopname").toString());

				if(index == list.size()-1){
					orderMap.put("details", detailList);
					orderList.add(orderMap);
				} 
				index++;
				
			}
		}
		
		return orderList;
	}
	
	 
}
