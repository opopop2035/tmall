package com.tmall.dao.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.tmall.dao.ProductImageDao;
import com.tmall.model.Product;
import com.tmall.model.ProductImage;
@Repository("productImageDao")
public class ProductImageDaoImpl implements ProductImageDao{
	@Resource
	private HibernateTemplate hibernateTemplate;
	

	
	@Override
	public List<ProductImage> list() {
		return (List<ProductImage>) hibernateTemplate.find("from ProductImage p");
	}

	@Override
	public List<ProductImage> listByPid(Product product,String type) {
		List<ProductImage> productImages = (List<ProductImage>) hibernateTemplate.find("from ProductImage pi where pi.product.id=? and pi.type=?", product.getId(),type);
		return productImages;
	}
	
	@Override
	public void setFirstProductImage(Product p) {
        List<ProductImage> pis= listByPid(p, ProductImage.type_single);
        if(!pis.isEmpty())
        	p.setFirstProductImage(pis.get(0));
    }
}
