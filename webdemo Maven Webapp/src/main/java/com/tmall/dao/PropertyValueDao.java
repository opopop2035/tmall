package com.tmall.dao;

import java.util.List;

import com.tmall.model.PropertyValue;

public interface PropertyValueDao {
	public List<PropertyValue> search(int pid);
}
