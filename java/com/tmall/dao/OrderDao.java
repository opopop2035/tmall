package com.tmall.dao;

import java.util.List;

import com.tmall.model.Order;

public interface OrderDao {
	public void addOrder(Order order);
	public void updateOrder(Order order);
	public Order searchById(int oid);
	public List<Order> list(int uid,String excludedStatus,int start,int count);
}
