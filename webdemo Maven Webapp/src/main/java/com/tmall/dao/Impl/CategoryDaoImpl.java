package com.tmall.dao.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.tmall.dao.CategoryDao;
import com.tmall.model.Category;
@Repository("categoryDao")
public class CategoryDaoImpl implements CategoryDao{
	@Resource
	private HibernateTemplate hibernateTemplate;
	@Override
	public Category searchByid(int cid) {
		List<Category> lc = (List<Category>) hibernateTemplate.find("from Category c where c.id=?", cid);
		return lc.get(0);
	}
	@Override
	public List<Category> listCategory() {
		List<Category> lc =  (List<Category>) hibernateTemplate.find("from Category c");
		return lc;
	}
	@Override
	public int getQuantity(){
		List<Integer> categoryQuantityList = (List<Integer>) hibernateTemplate.find("select count(c.id) from Category c");
		return categoryQuantityList.get(0);
	}
	 
}
