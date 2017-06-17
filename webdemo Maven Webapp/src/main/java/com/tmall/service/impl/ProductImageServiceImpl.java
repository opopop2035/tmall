package com.tmall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tmall.dao.ProductImageDao;
import com.tmall.model.Product;
import com.tmall.model.ProductImage;
import com.tmall.service.ProductImageService;
@Service("productImageService")
public class ProductImageServiceImpl implements ProductImageService{
	
	@Resource
	private ProductImageDao productImageDao;

	@Override
	public List<ProductImage> listSingleImageByp(Product product) {
		return productImageDao.listByPid(product, ProductImage.type_single);
	}

	@Override
	public List<ProductImage> listDetailImageByp(Product product) {
		return productImageDao.listByPid(product, ProductImage.type_detail);
	}

	@Override
	public void setFirstProductImage(Product p) {
		productImageDao.setFirstProductImage(p);
	}


}
