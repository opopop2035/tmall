package com.tmall.dao;

import java.util.List;

import com.tmall.model.OrderItem;

public interface OrderItemDao {
	public int getSaleCount(int pid);
	public List<OrderItem> searchByUser(int uid);
	public void addOrderItem(OrderItem orderItem);
	public void updateOrderItem(OrderItem orderItem);
	public OrderItem searchByOiid(int oid);
	public List<OrderItem> listByOid(int oid);
	public void delteOrderItem(OrderItem oi);
}
