package com.tmall.service;

import java.util.List;

import com.tmall.model.Order;
import com.tmall.model.OrderItem;

public interface OrderItemService {
	public List<OrderItem> listByUser(int uid);
	public void addOrderItem(OrderItem orderItem);
	public void updateOrderItem(OrderItem orderItem);
	public OrderItem listByOiid(int oiid);
	public void fill(List<Order> os);
	public void deleteOrderItem(OrderItem oi);
	public void fill(Order o);
}
