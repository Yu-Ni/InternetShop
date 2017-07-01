package com.cqut.model.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqut.model.dao.LoginDao;
import com.cqut.model.pojo.Admin;
import com.cqut.model.pojo.Buyer;
import com.cqut.model.pojo.Seller;
import com.cqut.model.service.LoginService;
import com.cqut.util.MD5;
import com.cqut.util.UID;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private LoginDao dao;
	
	@Override
	public Seller loginSeller(String username, String password) {
		password=MD5.getMD5(password);
		return dao.loginSeller(username,password);
	}
	
	@Override
	public Buyer loginBuyer(String username, String password) {
		password=MD5.getMD5(password);
		return dao.loginBuyer(username,password);
	}

	@Override
	public Admin loginAdmin(String username, String password) {
		password=MD5.getMD5(password);
		return dao.loginAdmin(username,password);
	}

	@Override
	public int sellerRegister(Seller seller) {
		seller.setSellerId(UID.createID());
		seller.setPassword(MD5.getMD5(seller.getPassword()));
		return dao.sellerRegister(seller);
	}

	@Override
	public int buyerRegister(Buyer buyer) {
		buyer.setBuyerid(UID.createID());
		buyer.setPassword(MD5.getMD5(buyer.getPassword()));
		return dao.buyerRegister(buyer);
	}

	@Override
	public int adminRegister(Admin admin) {
		admin.setAdminid(UID.createID());
		admin.setPassword(MD5.getMD5(admin.getPassword()));
		return dao.adminRegister(admin);
	}

	@Override
	public Buyer validate(String username) {
		return dao.validate(username);
	}

	@Override
	public Admin validate1(String username) {
		return dao.validate1(username);
	}

	@Override
	public Seller validate2(String username) {
		// TODO Auto-generated method stub
		return dao.validate2(username);
	}

}
