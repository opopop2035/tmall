package com.tmall.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tmall.dao.CategoryDao;
import com.tmall.dao.ProductDao;
import com.tmall.dao.ProductImageDao;
import com.tmall.model.Category;
import com.tmall.model.Product;
import com.tmall.service.CategoryService;
@Service("categoryService")
public class CategoryServiceImpl implements CategoryService{
	@Resource
	private CategoryDao categoryDao;
	@Resource
	private ProductDao productDao;
	@Resource
	private ProductImageDao productImageDao;
	
	@Override
	public List<Category> listByRow(List<Category> categorys){
		int productNumberEachRow = 8;
		for (Category category : categorys) {
			List<List<Product>> list = new ArrayList<List<Product>>();
		List<Product> products =  productDao.list(category.getId());
			for (int i = 0; i < products.size(); i+=productNumberEachRow) {
				int size = i+productNumberEachRow;
				size = size>products.size()?products.size():size;
				List<Product> productsOfEachRow = products.subList(i, size);
				list.add(productsOfEachRow);
			}
			category.setProductsByRow(list);
			List<Product> pros = category.getProducts();
			for (int i = 0; i < pros.size(); i++) {
				productImageDao.setFirstProductImage(pros.get(i));
			}
		}
		return categorys;
	}
	
	@Override
	public List<Category> listCategory(){
		List<Category> categorys = categoryDao.listCategory();
		return categorys;
	}
	@Override
	public List<Product> listProductByCID(int cid){
		List<Product> products =  productDao.list(cid);
		return products;
	}
	
	@Override
	public Category fillCategory(int cid){
		List<Product> products = productDao.list(cid);
		Category category = categoryDao.searchByid(cid);
		for (Product product : products) {
			productImageDao.setFirstProductImage(product);
		}
		category.setProducts(products);
		return category;
	}
}
