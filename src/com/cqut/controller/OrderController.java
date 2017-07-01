package com.cqut.controller;

import java.util.List;
import java.util.Map;

import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqut.model.pojo.Order;
import com.cqut.model.pojo.OrderDetail;
import com.cqut.model.service.OrderDetailService;
import com.cqut.model.service.OrderService;

@Controller
@RequestMapping("/orderController")
public class OrderController {

	@Autowired
	OrderService orderService;
	@Autowired
	OrderDetailService orderDetailService;
	
	/**
	 * 
		 * 
		 * @Description: 根据登录的账号获取用户的订单列表
		 * @param @param  
		 * @param @return   
		 * @return  String  
		 * @throws
		 * @author  雨虹
		 * @date  2017年6月21日
	 */
	@RequestMapping("/getOrderList") 
	 @ResponseBody
	public String getOrderList(HttpServletRequest request){
		
		  
		  HttpSession session = request.getSession();
		  String userId =""; 
		  if(session.getAttribute("buyerid")!=null){
			  userId = session.getAttribute("buyerid").toString(); 
		  } 
		List<Map<String,Object>> list = orderService.getOrderByCondition(userId, "");
		return JSONArray.fromObject(list).toString();
	}
	
	/**
	 * 
		 * 
		 * @Description: 根据登录的账号获取用户的订单列表
		 * @param @param  
		 * @param @return   
		 * @return  String  
		 * @throws
		 * @author  雨虹
		 * @date  2017年6月21日
	 */
	@RequestMapping("/getOrderListByCondition") 
	 @ResponseBody
	public String getOrderListByCondition(HttpServletRequest request,String searchinfo){
		
		  String condition = searchinfo;
		  
		  HttpSession session = request.getSession();
		  String userId =""; 
		  if(session.getAttribute("buyerid")!=null){
			  userId = session.getAttribute("buyerid").toString(); 
		  } 
		List<Map<String,Object>> list = orderService.getOrderByCondition(userId, condition);
		return JSONArray.fromObject(list).toString();
	}
	
	/**
	 * 
		 * 
		 * @Description: 创建一个订单，只包含一个商品
		 * @param @param  
		 * @param @return   
		 * @return  String  
		 * @throws
		 * @author  雨虹
		 * @date  2017年6月21日
	 */
	@RequestMapping("/createOrderOne") 
	 @ResponseBody
	public String createOrderOneOne(HttpServletRequest request,String buyerid,String productId,String shopId,String number,String price ){
		
		  HttpSession session = request.getSession();
		  String userId ="";
		  if(session.getAttribute("buyerid")!=null){
			  userId = session.getAttribute("buyerid").toString();
		  }
		  int number1 = Integer.parseInt(number); 
		  double price1= Double.parseDouble(price);
		 
		 Order order = new Order();
		 order.setBuyerId(userId);
		 order.setPrice(price1);
		 order.setShopId(shopId); 
		 String orderId = orderService.createOrderOne(order);
		 
		 if(!(orderId).equals("0")){
			 OrderDetail orderDetail = new OrderDetail();
			 orderDetail.setProductId(productId);
			 orderDetail.setNumber(number1);
			 orderDetail.setPrice(price1);
			 orderDetail.setStatus(0);
			 orderDetail.setOrderId(orderId);
			 try {
				 orderDetailService.createOrderDetail(orderDetail);
				 return "1";
				 
			} catch (Exception e) { 
				orderService.delete(orderId);
				return "0";
			}
			
			 
		 } 
		 
		return null;
		 
		  
	}
	
	/**
	 * 
		 * 
		 * @Description: 删除订单
		 * @param @param  
		 * @param @return   
		 * @return  String  
		 * @throws
		 * @author  雨虹
		 * @date  2017年6月23日
	 */
	@RequestMapping("/deleteOrder") 
	 @ResponseBody
	public String deleteOrder(String orderId){
		
		int result = orderService.delete(orderId);
		if(result==0){
			return "0";
		}else{
			return "1";

		} 
		 
	}
	
	/**
	 * 
		 * 
		 * @Description: 确认收货更新订单详情的状态
		 * @param @param  orderdetailid
		 * @param @return   
		 * @return  String  
		 * @throws
		 * @author  雨虹
		 * @date  2017年6月23日
	 */
	@RequestMapping("/received") 
	 @ResponseBody
	public String received(String orderdetailid){
		 
		int result = orderDetailService.received(orderdetailid);
		if(result==0){
			return "0";
		}else{
			return "1";

		} 
		 
	}

}
