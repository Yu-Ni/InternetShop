package com.cqut.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqut.model.pojo.Individual;
import com.cqut.model.service.IndividualService;

import javassist.runtime.Inner;

@Controller
@RequestMapping("/IndividualController")
public class IndividualController {

	@Autowired
	private IndividualService service;

	@RequestMapping("/getIndInfo")
	@ResponseBody
	public String getIndInfo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String name = session.getAttribute("sellerId").toString();
		return JSONObject.fromObject(service.getIndInfo(name)).toString();
	}

	@RequestMapping("/updateInd")
	@ResponseBody
	public String updateInd(String sellerId, String username, String realname, String banknumber, String phonenumber,
			String address, String id_card) {
		Individual individual = new Individual();
		individual.setSellerId(sellerId);
		individual.setUsername(username);
		individual.setRealname(realname);
		individual.setBanknumber(banknumber);
		individual.setPhonenumber(phonenumber);
		individual.setAddress(address);
		individual.setId_card(id_card);
		 try {
			 service.UpdateInd(individual);
			 return "1";
		} catch (Exception e) {
			 return "0";

		} 
	}

}
