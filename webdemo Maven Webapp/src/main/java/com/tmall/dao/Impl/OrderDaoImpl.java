package com.tmall.dao.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.tmall.dao.OrderDao;
import com.tmall.model.Order;

@Repository("orderDao")
public class OrderDaoImpl implements OrderDao{
	@Resource
	private HibernateTemplate hibernateTemplate;
	
	@Override
	public void addOrder(Order order){
		hibernateTemplate.save(order);
	}
	
	@Override
	public void updateOrder(Order order){
		hibernateTemplate.update(order);
	}
	
	@Override
	public Order searchById(int oid){
		return (Order) hibernateTemplate.find("from Order o where o.id=?",oid).get(0);
	}
	@Override
	public List<Order> list(int uid,String excludedStatus,int start,int count){
		Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
		return session.createQuery("from Order o where o.user.id=? and o.status!=? order by id desc")
		.setParameter(0, uid).setParameter(1, excludedStatus)
		.setFirstResult(start).setMaxResults(count)
		.getResultList();
	}
}
