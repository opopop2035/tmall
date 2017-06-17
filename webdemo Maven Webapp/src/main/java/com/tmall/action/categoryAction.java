package com.tmall.action;

import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.tmall.model.Category;
import com.tmall.model.Product;
import com.tmall.service.CategoryService;
import com.tmall.service.ProductService;
import com.tmall.util.comparator.ProductAllComparator;
import com.tmall.util.comparator.ProductDateComparator;
import com.tmall.util.comparator.ProductPriceComparator;
import com.tmall.util.comparator.ProductReviewComparator;
import com.tmall.util.comparator.ProductSaleCountComparator;

@Controller("categoryAction")
@Scope("prototype")
public class categoryAction extends ActionSupport implements ServletRequestAware{
	
	private HttpServletRequest request;
	@Resource
	private CategoryService categoryService;
	@Resource
	private ProductService productService;
	
	@Override
	public String execute() throws Exception {
		int cid =  Integer.parseInt(request.getParameter("cid"));
		List<Product> products = categoryService.listProductByCID(cid);
		Category category = categoryService.fillCategory(cid);
		productService.setSaleAndReviewNumber(products);
		
		String sort = request.getParameter("sort");
		if (sort != null) {
			switch (sort) {
			case "review":
				Collections.sort(category.getProducts(), new ProductReviewComparator());
				break;
			case "date":
				Collections.sort(category.getProducts(), new ProductDateComparator());
				break;
			case "saleCount":
				Collections.sort(category.getProducts(), new ProductSaleCountComparator());
				break;
			case "price":
				Collections.sort(category.getProducts(), new ProductPriceComparator());
				break;
			case "all":
				Collections.sort(category.getProducts(), new ProductAllComparator());
				break;
			}
		}
		request.setAttribute("c", category);
		return "category";
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

}
