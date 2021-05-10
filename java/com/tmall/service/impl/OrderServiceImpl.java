package com.tmall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tmall.dao.OrderDao;
import com.tmall.model.Order;
import com.tmall.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	@Resource
	private OrderDao orderDao;
	
	@Override
	public void addOrder(Order order){
		orderDao.addOrder(order);
	}
	@Override
	public Order searchByOid(int oid){
		return orderDao.searchById(oid);
	}
	@Override
	public void update(Order order) {
		orderDao.updateOrder(order);
	}
	@Override
	public List<Order> list(int uid,String excludedStatus){
		return orderDao.list(uid, excludedStatus, 0, Short.MAX_VALUE);
	}
}
