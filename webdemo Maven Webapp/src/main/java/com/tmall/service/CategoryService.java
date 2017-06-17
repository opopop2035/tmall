package com.tmall.service;

import java.util.List;

import com.tmall.model.Category;
import com.tmall.model.Product;

public interface CategoryService {
	public List<Category> listByRow(List<Category> categorys);
	public List<Category> listCategory();
	public List<Product> listProductByCID(int cid);
	public Category fillCategory(int cid);
}
