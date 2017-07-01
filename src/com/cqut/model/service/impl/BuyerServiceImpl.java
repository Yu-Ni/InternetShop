package com.cqut.model.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqut.model.dao.BuyerDao;
import com.cqut.model.pojo.Commodity;
import com.cqut.model.pojo.Notice;
import com.cqut.model.service.BuyerService;
@Service
public class BuyerServiceImpl implements BuyerService{
	@Autowired
	private BuyerDao dao;
	@Override
	public List<Commodity> selectByTypeName(String typename) {
		return dao.selectByTypeName(typename);
	}
	@Override
	public List<Commodity> selectAll() {		
		return dao.selectAll();
	}
	@Override
	public List<Notice> selectNotice() {
		return dao.selectNotice();
	}
}
