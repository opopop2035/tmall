package com.tmall.dao.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.tmall.dao.ReviewDao;
import com.tmall.model.Review;

@Repository("reviewDao")
public class ReviewDaoImpl implements ReviewDao{
	@Resource
	private HibernateTemplate hibernateTemplate;
	
	@Override
	public int getCount(int pid){
		Long count =   (Long) hibernateTemplate.find("select count(r) from Review r where r.product.id=?", pid).get(0);
		return count.intValue();
	}
	
	@Override
	public List<Review> searchById(int pid){
		return (List<Review>) hibernateTemplate.find("from Review r where r.product.id=? order by id desc", pid);
	}

	@Override
	public void addReview(Review review) {
		hibernateTemplate.save(review);
	}
	
}
