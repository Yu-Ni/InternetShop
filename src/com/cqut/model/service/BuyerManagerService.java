package com.cqut.model.service;

import java.util.List;

import com.cqut.model.pojo.Buyer;
import com.cqut.model.pojo.Commodity;

public interface BuyerManagerService {
	public List<Buyer> queryByUserName(String input);
	//public Commodity selectByTypeId(String typename);
	public void insert(Buyer buyer);
	public void update(Buyer buyer);
	public void delete(String buyers);
}
