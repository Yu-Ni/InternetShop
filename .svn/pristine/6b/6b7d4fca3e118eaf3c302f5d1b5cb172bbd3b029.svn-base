package com.cqut.model.dao;

import org.springframework.stereotype.Repository;

import com.cqut.model.pojo.Admin;
import com.cqut.model.pojo.Buyer;
import com.cqut.model.pojo.Seller;

@Repository
public interface LoginDao {
	
	public Seller loginSeller(String username,String password);
	public Buyer loginBuyer(String username,String password);
	public Admin loginAdmin(String username,String password);
	public int sellerRegister(Seller seller);
	public int buyerRegister(Buyer buyer);
	public int adminRegister(Admin admin);
	public Buyer validate(String username);	
	public Admin validate1(String username);
	public Seller validate2(String username);
}
