package com.tmall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tmall.dao.OrderItemDao;
import com.tmall.dao.ProductDao;
import com.tmall.dao.ReviewDao;
import com.tmall.model.Product;
import com.tmall.service.ProductImageService;
import com.tmall.service.ProductService;
@Service("productService")
public class ProductServiceImpl implements ProductService{
	@Resource
	private ProductDao productDao;
	@Resource
	private OrderItemDao orderItemDao;
	@Resource
	private ReviewDao reviewDao;
	@Resource
	private ProductImageService productImageService;
	
	@Override
	public Product get(int id){
		return productDao.searchById(id);
	}
	
	@Override
	public void setSaleAndReviewNumber(Product p){
		p.setSaleCount(orderItemDao.getSaleCount(p.getId()));
		p.setReviewCount(reviewDao.getCount(p.getId()));
	}
	@Override
	public void setSaleAndReviewNumber(List<Product> products){
		for (Product product : products) {
			setSaleAndReviewNumber(product);
		}
	}
	@Override
	public List<Product> search(String keyword, int start, int count) {
		List<Product> products = productDao.listByKeyword(keyword, start, count);
		for (Product product : products) {
			productImageService.setFirstProductImage(product);
		}
		return products;
	}
}
