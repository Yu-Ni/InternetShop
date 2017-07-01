package com.cqut.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqut.model.pojo.Cart;
import com.cqut.model.service.CartManageService;

@Controller
@RequestMapping("/cartManageController")
public class CartManageController {
	
	@Autowired
	private CartManageService service;
	
	/**
	 * 
	 * 方法简述：展示当前买家的购物车信息
	 * @param username 当前买家姓名
	 * @return 
	 * @author wangyuanling
	 * @date 2017年6月20日 下午12:44:38
	 */
	@RequestMapping("/getCartList")
	@ResponseBody
	public String getCartList(HttpServletRequest request,String goodType,String searchContent){
		HttpSession session = request.getSession();
		String buyername = (String) session.getAttribute("buyername");
		List<Map<String,Object>> list = service.getCartList(buyername,goodType,searchContent);
		return JSONArray.fromObject(list).toString();
	}
	
	/**
	 * 
	 * 方法简述：购买单个物品
	 * @param cartid 购物车id
	 * @param request
	 * @return 
	 * @author wangyuanling
	 * @date 2017年6月20日 下午8:41:37
	 */
	@RequestMapping("/addOrderByCart")
	@ResponseBody
	public String addOrderByCart(String cartid,HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("buyername");
		int result=service.addOrderByCart(cartid,username);
		if(result==1){
			if(service.deleteCart(cartid)==1){
				map.put("result","true");
			}else{
				map.put("result","fail");
			}
		}else{
			map.put("result","fail");
		}
		return JSONArray.fromObject(map).toString();
	}

	/**
	 * 
	 * 方法简述：购买商店所有物品
	 * @param shopid 商店id
	 * @param request
	 * @return 
	 * @author wangyuanling
	 * @date 2017年6月20日 下午8:42:07
	 */
	@RequestMapping("/addOrderByCartShop")
	@ResponseBody
	public String addOrderByCartShop(String shopid,HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("buyername");
		int result=service.addOrderByCartShop(shopid,username);
		if(result==1){
			if(service.deleteCartShop(username,shopid)==1){
				map.put("result","true");
			}else{
				map.put("result","fail");
			}
		}else{
			map.put("result","fail");
		}
		return JSONArray.fromObject(map).toString();
	}
	
	/**
	 * 
		 * 
		 * @Description: 添加到购物车
		 * @param @param  
		 * @param @return   
		 * @return  String  
		 * @throws
		 * @author  雨虹
		 * @date  2017年6月21日
	 */
	@RequestMapping("/addToCart")
	@ResponseBody
	public String addToCart(HttpServletRequest request ,String productId,String number) {
		
		 HttpSession session = request.getSession();
		  String userId ="";
		  if(session.getAttribute("buyerid")!=null){
			  userId = session.getAttribute("buyerid").toString();
		  }
		  int number1 = Integer.parseInt(number); 
		  Cart cart = new Cart();
		  
		  cart.setBuyerid(userId);
		  cart.setNumber(number1);
		  cart.setProductid(productId); 
		   
		  try {
			  service.addCart(cart);
			  return "1";
		} catch (Exception e) {
		 
			return "0";
		}
		  
 		
	}
	
	/**
	 * 
	 * 方法简述：deleteCart 删除购物车的商品
	 * @param cartid
	 * @return 
	 * @author wangyuanling
	 * @date 2017年6月22日 下午12:57:34
	 */
	@RequestMapping("/deleteCart")
	@ResponseBody
	public String deleteCart(String cartid){
		Map<String,Object> map = new HashMap<String,Object>();
		if(service.deleteCart(cartid)==1){
			map.put("result","true");
		}else{
			map.put("result","fail");
		}
		return JSONArray.fromObject(map).toString();
	}

}
