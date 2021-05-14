package com.tmall.dao;

import java.util.List;

import com.tmall.model.Product;
import com.tmall.model.ProductImage;

public interface ProductImageDao {
	public List<ProductImage> list();
	public List<ProductImage> listByPid(Product product,String type);
	public void setFirstProductImage(Product p);
}
