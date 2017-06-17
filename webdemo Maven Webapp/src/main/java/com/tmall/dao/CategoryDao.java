package com.tmall.dao;

import java.util.List;

import com.tmall.model.Category;

public interface CategoryDao {
	public Category searchByid(int cid);
	public List<Category> listCategory();
	public int getQuantity();
}
