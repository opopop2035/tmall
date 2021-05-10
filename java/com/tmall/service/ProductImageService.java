package com.tmall.service;

import java.util.List;

import com.tmall.model.Product;
import com.tmall.model.ProductImage;

public interface ProductImageService {
	public List<ProductImage> listSingleImageByp(Product product);
	public List<ProductImage> listDetailImageByp(Product product);
	public void setFirstProductImage(Product p);
}
