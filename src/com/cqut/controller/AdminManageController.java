package com.cqut.controller;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqut.model.pojo.Admin;
import com.cqut.model.pojo.Commodity;
import com.cqut.model.service.AdminManageService;
import com.cqut.util.MD5;

@Controller
@RequestMapping("/adminManageController")
public class AdminManageController {
	
	@Autowired
	private AdminManageService service;
	
	 @RequestMapping("/getAdminList") 
	 @ResponseBody
	 public String getAdminList(String condition){
		 
			 condition = "%"+condition+"%"; 
		 return JSONArray.fromObject(service.getAdminByCondition(condition)).toString();
	 }
	 @RequestMapping("/addRole") 
	 @ResponseBody
	 public String addRole(String adminid,String username ,String realname,String password,String telphone,String avatar,int sex ){
		  
		
		  Admin admin=new Admin();
		  admin.setAdminid(adminid);
		  admin.setUsername(username);
		  admin.setRealname(realname);
		  admin.setPassword(MD5.getMD5(password)); 
		  admin.setTelphone(telphone);
		  admin.setAvatar(avatar);
		  admin.setSex(sex);
		 try {
			 service.insert(admin);
			 return "ture";
		} catch (Exception e) {
			 return "false";

		} 
 	 }
	 @RequestMapping("/delAdmin")  
	    @ResponseBody
		public String delAdmin(String adminids){
		 try {
			  service.delete(adminids);
				return "1";

		} catch (Exception e) {
			// TODO: handle exception
		}
			return "0"; 
		 
		}
	 
	 @RequestMapping("/updateAdmin") 
	 @ResponseBody
	 public String  updateAdmin(String adminid,String username ,String realname,String password,String telphone,String avatar,String sex ){
		  
		 
		 int Sex = Integer.parseInt(sex);
		 Admin admin=new Admin();
		  admin.setAdminid(adminid);
		  admin.setUsername(username);
		  admin.setRealname(realname);
		  admin.setPassword(MD5.getMD5(password)); 
		  admin.setTelphone(telphone);
		  admin.setAvatar(avatar);
		  admin.setSex(Sex);
		 try {
			 service.update(admin);
			 return "ture";
		} catch (Exception e) {
			 return "false";

		} 
 	 }



	
	 
}
