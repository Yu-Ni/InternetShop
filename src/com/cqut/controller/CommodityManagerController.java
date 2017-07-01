package com.cqut.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cqut.model.pojo.Commodity;
import com.cqut.model.pojo.Shop;
import com.cqut.model.service.AdminManageService;
import com.cqut.model.service.CommodityService;
import com.cqut.model.service.ShopService;

@Controller
@RequestMapping("/commodityManagerController")
public class CommodityManagerController {

	@Autowired
	private CommodityService service;
	
	@Autowired
	private ShopService shopService;
	
	@RequestMapping("/getCommodity") 
	 @ResponseBody
	 public String getCommodity(String productId){ 
		 return JSONArray.fromObject(service.getCommodityById(productId)).toString();
	 }
	
	 @RequestMapping("/getCommodityList") 
	 @ResponseBody
	 public String getCommodityList(String condition,HttpServletRequest request){
		HttpSession session = request.getSession();
		String sellerId=session.getAttribute("sellerId").toString();
		return JSONArray.fromObject(service.getCommodityByCondition(sellerId)).toString();
	 }
	 
	 @RequestMapping("/addCommodity") 
	 @ResponseBody
	 public void addCommodity(MultipartFile image,HttpServletRequest request,HttpServletResponse response) throws IOException{
		 
		 HttpSession session = request.getSession();
		 String sellerId = "";
		  if(session.getAttribute("sellerId")!=null){
			  sellerId = session.getAttribute("sellerId").toString();
		 }
		 
		  Shop shop =  shopService.getShopInfo(sellerId);
		
		 String uploadUrl = request.getServletContext().getRealPath("/upload/");
		 String typeId = request.getParameter("typeid");
		 String productName = request.getParameter("productname"); 
 		 String margin = request.getParameter("margin");
		 String productPrice = request.getParameter("price");	
		 String remark = request.getParameter("remark");
		 String description = request.getParameter("description");
		 
		 String fileName = "";
		 if(image.getSize()!=0){
				fileName = image.getOriginalFilename();
			}else{
				fileName="emptyImg.jpg";
			}
			String productimg = fileName; 
			 double price =0.0;
			 int productMargin=0;
		 if(isNumeric(productPrice)){
			  price = Double.parseDouble(productPrice);
		 }
		 if(isNumeric(margin)){
			  productMargin = Integer.parseInt(margin);
		 }		  
		 Commodity commodity = new Commodity();
		 commodity.setTypeId(typeId);
		 commodity.setProductName(productName);
  		 commodity.setPrice(price);
  		 commodity.setImg(productimg);
  		 commodity.setRemark(remark);
  		 commodity.setProductMargin(productMargin);
  		 commodity.setDescription(description);

  		 if(shop!=null&&shop.getShopid()!=null&&!shop.getShopid().equals("")){
  			  
  			  String shopId =  shop.getShopid();
  			  commodity.setShopId(shopId);
  		// 判断最终上传文件是否存在，如果不存在，则创建相应的文件
				File targetFile = new File(uploadUrl+"\\"+fileName); 
				try {
					 service.insert(commodity);
					 if(!targetFile.exists()){
						try {
							targetFile.createNewFile();
							image.transferTo(targetFile);
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				} catch (Exception e) { 
						request.setAttribute("result","添加失败！"); 
				}   
				try {
					request.getRequestDispatcher("../module/jsp/seller/CommodityIndex.jsp").forward(request,response);
				} catch (ServletException e) {
					e.printStackTrace();
				} 
  		 }
  	
 	 }
	 
	 @RequestMapping("/delCommodity")  
	    @ResponseBody
		public String delCommodity(String productIds){
		 try {
			  service.delete(productIds);
				return "1";

		} catch (Exception e) {
			// TODO: handle exception
		}
			return "0"; 
		 
		}
	 
	 
	 @RequestMapping("/updateCommodity") 
	 @ResponseBody
	 public void updateCommodity(MultipartFile image,HttpServletRequest request,HttpServletResponse response){
		 
		 
		 HttpSession session = request.getSession();
		 String sellerId = "";
		  if(session.getAttribute("sellerId")!=null){
			  sellerId = session.getAttribute("sellerId").toString();
		 }
		 
		  Shop shop =  shopService.getShopInfo(sellerId);
		
		 String uploadUrl = request.getServletContext().getRealPath("/upload/");
		 
		 String productId = request.getParameter("productid");
		 String typeId = request.getParameter("typeid");
		 String productName = request.getParameter("productname"); 
 		 String margin = request.getParameter("margin");
		 String productPrice = request.getParameter("price");	
		 String remark = request.getParameter("remark");
		 String description = request.getParameter("description");
		 
		 String fileName = "";
		 if(image.getSize()!=0){
				fileName = image.getOriginalFilename();
			}else{
				fileName="emptyImg.jpg";
			}
			String productimg = fileName; 
			 double price =0.0;
			 int productMargin=0;
		 if(isNumeric(productPrice)){
			  price = Double.parseDouble(productPrice);
		 }
		 if(isNumeric(margin)){
			  productMargin = Integer.parseInt(margin);
		 }		  
		 Commodity commodity = new Commodity();
		 commodity.setTypeId(typeId);
		 commodity.setProductName(productName);
  		 commodity.setPrice(price);
  		 commodity.setImg(productimg);
  		 commodity.setRemark(remark);
  		 commodity.setProductMargin(productMargin);
  		 commodity.setDescription(description);
  		 commodity.setProductId(productId);

  		 if(shop!=null&&shop.getShopid()!=null&&!shop.getShopid().equals("")){
  			  
  			  String shopId =  shop.getShopid();
  			  commodity.setShopId(shopId);
  		// 判断最终上传文件是否存在，如果不存在，则创建相应的文件
				File targetFile = new File(uploadUrl+"\\"+fileName); 
				try {
					 service.update(commodity);
					 if(!targetFile.exists()){
						try {
							targetFile.createNewFile();
							image.transferTo(targetFile);
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				} catch (Exception e) { 
						request.setAttribute("result","添加失败！"); 
				}   
				try {
					request.getRequestDispatcher("../module/jsp/seller/CommodityIndex.jsp").forward(request,response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
  		 }  
 	 }
	 
	 /**
	  * 
	  * 方法简述：获取所有商品类型
	  * @return 
	  * @author wangyuanling
	  * @date 2017年6月21日 下午3:18:12
	  */
	 @RequestMapping("/getAllGoodType") 
	 @ResponseBody
	 public String getAllGoodType(){
		 return JSONArray.fromObject(service.getAllGoodType()).toString();
	 }
	 
	 public static boolean isNumeric(String str){
		  for (int i = 0; i < str.length(); i++){
		   System.out.println(str.charAt(i));
		   if (!Character.isDigit(str.charAt(i))){
		    return false;
		   }
		  }
		  return true;
		 }
}
