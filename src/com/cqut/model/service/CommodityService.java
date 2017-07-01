package com.cqut.model.service;

import java.util.List;



import java.util.Map;

import com.cqut.model.pojo.Commodity;
import com.cqut.model.pojo.Type;

public interface CommodityService {


	//����
	public void insert(Commodity commodity);
	//ɾ��
	public void delete(String productIds);
	//�޸�
	public void update(Commodity commodity);
	//��ѯ
	public Commodity getCommodityById(String productId);
	//���������ѯ�б�
	public List<Map<String,Object>> getCommodityByCondition(String sellerId);
	public List<Map<String,Object>> getAllGoodType();
}
