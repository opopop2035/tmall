package com.tmall.dao.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.tmall.dao.ProductDao;
import com.tmall.model.Product;
@Repository("productDao")
public class ProductDaoImpl implements ProductDao{
	@Resource
	private HibernateTemplate hibernateTemplate;
	@Override
	public List<Product> list(int cid) {
		List<Product> cl = (List<Product>) hibernateTemplate.find("from Product p where p.category.id=?",cid);
		return cl;
	}

	@Override
	public List<Product> list(int cid, int start, int end) {
		DetachedCriteria dp = DetachedCriteria.forClass(Product.class);
		List<Product> cl = (List<Product>) hibernateTemplate.findByCriteria(dp, start, end-start);
		return cl;
	}

	@Override
	public int getQuantity(int cid) {
		List<Integer> cq = (List<Integer>) hibernateTemplate.find("select conunt(p.id) from Product p where cid=?",cid );
		return cq.get(0);
	}
	
	@Override
	public Product searchById(int id){
		return (Product) hibernateTemplate.find("from Product p where p.id=?", id).get(0);
	}
	
	@Override
	public List<Product> listByKeyword(String keyword,int start,int count){
		Session session = hibernateTemplate.getSessionFactory().getCurrentSession();
		return session.createQuery("from Product p where p.name like ?").setParameter(0,"%"+keyword+"%").setFirstResult(start).setMaxResults(count).getResultList();
	}

}
