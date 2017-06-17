package com.tmall.util.comparator;

import java.util.Comparator;

import com.tmall.model.Product;

public class ProductPriceComparator implements Comparator<Product>{

	@Override
	public int compare(Product p1, Product p2) {
		return p1.getCreateDate().compareTo(p2.getCreateDate());
	}

}
