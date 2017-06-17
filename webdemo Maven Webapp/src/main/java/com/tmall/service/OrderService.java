package com.tmall.service;

import java.util.List;

import com.tmall.model.Order;

public interface OrderService {
	public void addOrder(Order order);
	public Order searchByOid(int oid);
	public void update(Order order);
	public List<Order> list(int uid,String excludedStatus);
}
