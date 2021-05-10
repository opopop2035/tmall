package com.tmall.service.impl;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tmall.dao.OrderItemDao;
import com.tmall.model.Order;
import com.tmall.model.OrderItem;
import com.tmall.service.OrderItemService;
import com.tmall.service.ProductImageService;
@Service("orderItemService")
public class OrderItemServiceImpl implements OrderItemService{
	@Resource
	private OrderItemDao orderItemDao;
	@Resource
	private ProductImageService productImageService;
	
	@Override
	public List<OrderItem> listByUser(int uid) {
		List<OrderItem> ois = orderItemDao.searchByUser(uid);
		for (Iterator<OrderItem> iterator = ois.iterator(); iterator.hasNext();) {
			OrderItem orderItem = iterator.next();
			System.out.println(orderItem.getOrder().getId());
			if (orderItem.getOrder().getId() != -1) {
				iterator.remove();
			}
		}	
		return ois;
	}

	@Override
	public void addOrderItem(OrderItem orderItem) {
		if (orderItem.getOrder() == null) {
			Order order = new Order();
			order.setId(-1);
			orderItem.setOrder(order);
		}
		orderItemDao.addOrderItem(orderItem);
	}

	@Override
	public void updateOrderItem(OrderItem orderItem) {
		orderItemDao.updateOrderItem(orderItem);
	}
	
	@Override
	public OrderItem listByOiid(int oiid){
		return orderItemDao.searchByOiid(oiid);
	}
	
	@Override
	public void fill(List<Order> os){
		for (Order order : os) {
			List<OrderItem> ois = orderItemDao.listByOid(order.getId());
			float total = 0;
            int totalNumber = 0;
			for (OrderItem orderItem : ois) {
				productImageService.setFirstProductImage(orderItem.getProduct());
				total += orderItem.getNumber()*orderItem.getProduct().getBarginPrice();
				totalNumber += orderItem.getNumber();
			}
			order.setTotal(total);
			order.setTotalNumber(totalNumber);
			order.setOrderItems(ois);
		}
	}
	
	@Override
	public void fill(Order o){
		List<OrderItem> ois = orderItemDao.listByOid(o.getId());
		float total = 0;
		for (OrderItem orderItem : ois) {
			productImageService.setFirstProductImage(orderItem.getProduct());
			total += orderItem.getNumber()*orderItem.getProduct().getBarginPrice();
		}
		o.setTotal(total);
		o.setOrderItems(ois);
	}
	@Override
	public void deleteOrderItem(OrderItem oi){
		orderItemDao.delteOrderItem(oi);
	}
}
