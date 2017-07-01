package com.cqut.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cqut.model.pojo.Order;
//��ʾ��������ݷ��ʲ�
@Repository
public interface OrderDao {

	//����
	public void  insert(Order order);
	//ɾ��
	public int delete(String orderId);
	//�޸�
	public void update(Order order);
	//��ѯ
	public Order getOrderById(String orderId);
	//���������ѯ�б�
	public List<Order> getOrderByCondition(String condition);
	//����û���ѯ�����б�
	public List<Order> getAllOrderByUserId(String userId);
	
 	
 }
