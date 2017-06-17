package com.tmall.dao.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.tmall.dao.PropertyValueDao;
import com.tmall.model.PropertyValue;

@Repository("propertyValueDao")
public class PropertyValueDaoImpl implements PropertyValueDao{
	@Resource
	private HibernateTemplate hibernateTemplate;
	
	@Override
	public List<PropertyValue> search(int pid) {
		return (List<PropertyValue>) hibernateTemplate.find("from PropertyValue pv where pv.product.id=?", pid);
	}
}
