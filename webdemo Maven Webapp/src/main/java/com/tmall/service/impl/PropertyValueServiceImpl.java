package com.tmall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tmall.dao.PropertyValueDao;
import com.tmall.model.PropertyValue;
import com.tmall.service.PropertyValueService;
@Service("propertyValueService")
public class PropertyValueServiceImpl implements PropertyValueService{

	@Resource
	private PropertyValueDao propertyValueDao;
	
	@Override
	public List<PropertyValue> listById(int pid){
		return propertyValueDao.search(pid);
	}
}
