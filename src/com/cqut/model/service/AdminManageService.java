package com.cqut.model.service;

import java.util.List;

import com.cqut.model.pojo.Admin;
import com.cqut.model.pojo.Commodity;


public interface AdminManageService {
	
/*	public List<Admin> queryByName(String input);*/
	
	 public String getAdminList(String condition);
	 public List<Admin> getAdminByCondition(String condition);
    
	 public void insert(Admin admin);

  	public void delete(String adminids);

  	public void update(Admin admin);
}
