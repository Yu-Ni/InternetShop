package com.cqut.model.service.impl;

import java.util.Calendar;
import java.util.List;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cqut.model.dao.AdminDao;
import com.cqut.model.pojo.Admin;
import com.cqut.model.service.AdminManageService;
import com.cqut.util.MD5;
import com.cqut.util.UID;

@Service
public class AdminManageServiceImpl implements AdminManageService {
	@Autowired
	private AdminDao dao;

	/*@Override
	public List<Admin> queryByName(String input) {
		// TODO Auto-generated method stub
		return dao.queryByName(input);
	}
*/
	@Override
	public void insert(Admin admin) {
		// TODO Auto-generated method stub
		String adminid = UID.createID();
		admin.setAdminid(adminid);
		admin.setPassword(MD5.getMD5(admin.getPassword()));
		dao.insert(admin);		
	}

	@Override
	public String getAdminList(String condition) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Admin> getAdminByCondition(String condition) {
		// TODO Auto-generated method stub
	
		return dao.getAdminByCondition(condition);
	
	}

	@Override
	public void delete(String adminids) {
		// TODO Auto-generated method stub

		dao.delete(adminids);
		
	}

	@Override
	public void update(Admin admin) {
		admin.setPassword(MD5.getMD5(admin.getPassword()));
		dao.update(admin);
		
	}
	
	
}
