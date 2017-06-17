package com.tmall.dao;

import java.util.List;

import com.tmall.model.Product;

public interface ProductDao {
	public List<Product> list(int cid);
	public List<Product> list(int cid,int start,int end);
	public int getQuantity(int cid);
	public Product searchById(int id);
	public List<Product> listByKeyword(String keyword,int start,int count);
}
