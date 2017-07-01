package com.cqut.controller;

import net.sf.json.JSONArray;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqut.model.pojo.Evaluation;
import com.cqut.model.service.EvaluationManagerService;

@Controller
@RequestMapping("/evaluationManagerController")
public class EvaluationManagerController {
	
	@Autowired
	private EvaluationManagerService service;
	
	 @RequestMapping("/getEvaluation") 
	 @ResponseBody
	 public String getEvaluation(String condition){
		 
			 condition = "%"+condition+"%"; 
		 return JSONArray.fromObject(service.getEvaluationByCondition(condition)).toString();
	 }
	
	 @RequestMapping("/updateEvaluation") 
	 @ResponseBody
	 public String  updateEvaluation(String evaluationid,String orderid ,String time,String content,String buyerid){
		
		 
		 SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
		 Evaluation eva=new Evaluation();
		  eva.setTime(time);
		 eva.setEvaluationid(evaluationid);
		 eva.setOrderid(orderid);
		 eva.setContent(content);
		 eva.setBuyerid(buyerid);
		 try {
			 service.update(eva);
			 return "ture";
		} catch (Exception e) {
			 return "false";

		} 
 	 }

	 
	  @RequestMapping("/delEvaluation")  
	    @ResponseBody
		public String delEvaluation(String evaluationid){
		 try {
			  service.delete(evaluationid);
				return "1";

		} catch (Exception e) {
			// TODO: handle exception
		}
			return "0"; 
		 
		}

	
	 
}
