package com.tmall.service;

import java.util.List;

import com.tmall.model.Product;

public interface ProductService {
	public Product get(int id);
	public void setSaleAndReviewNumber(Product p);
	public void setSaleAndReviewNumber(List<Product> products);
	public List<Product> search(String keyword, int start, int count);
}
