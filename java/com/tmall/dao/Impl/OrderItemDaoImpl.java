package com.tmall.dao.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.tmall.dao.OrderItemDao;
import com.tmall.model.Order;
import com.tmall.model.OrderItem;
@Repository("orderItemDao")
public class OrderItemDaoImpl implements OrderItemDao{
	@Resource
	private HibernateTemplate hibernateTemplate;
	
	@Override
	public int getSaleCount(int pid){
		List<Long> saleCounts =  (List<Long>) hibernateTemplate.find("select sum(o.number) from OrderItem o where o.product.id=?",pid);
		if(saleCounts.isEmpty() || saleCounts.get(0) == null){
			return 0;
			}
		return saleCounts.get(0).intValue();
	}
	
	@Override
	public List<OrderItem> searchByUser(int uid){
		return (List<OrderItem>) hibernateTemplate.find("from OrderItem oi where oi.user.id=?", uid);
	}
	
	@Override
	public void addOrderItem(OrderItem orderItem){
		Integer oid = new Integer(orderItem.getId());
		System.out.println(orderItem.getUser().getId());
		System.out.println(orderItem.getNumber());
		System.out.println(orderItem.getProduct().getId());
		if (oid.equals(0)) {
			Order order = new Order();
			order.setId(-1);
			orderItem.setOrder(order);
		}
		hibernateTemplate.save(orderItem);
	}
	
	@Override
	public void updateOrderItem(OrderItem orderItem){
		//hibernateTemplate.update(orderItem);
		Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
		Query q = session.createQuery("update OrderItem oi set oi.product.id=?,oi.user.id=?,oi.order.id=?,oi.number=? where oi.id=?")
		.setParameter(0,orderItem.getProduct().getId()).setParameter(1, orderItem.getUser().getId())
		.setParameter(3, orderItem.getNumber()).setParameter(4, orderItem.getId());
		if (orderItem.getOrder() == null) {
			q.setParameter(2, -1);
		}else{
			q.setParameter(2, orderItem.getOrder().getId());
		}
		q.executeUpdate();
	}
	
	@Override
	public OrderItem searchByOiid(int oiid){
		List<OrderItem> oi =   (List<OrderItem>) hibernateTemplate.find("from OrderItem oi where oi.id=?", oiid);
		return oi.get(0);
	}
	@Override
	public List<OrderItem> listByOid(int oid){
		return (List<OrderItem>) hibernateTemplate.find("from OrderItem oi where oi.order.id=?", oid);
	}
	@Override
	public void delteOrderItem(OrderItem oi){
		hibernateTemplate.delete(oi);
	}
}
