package com.tmall.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.tmall.model.Product;
import com.tmall.service.ProductService;

@Controller("search")
@Scope("prototype")
public class searchAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	@Resource
	private ProductService productService;
	
	@Override
	public String execute() throws Exception {
		String keyword = request.getParameter("keyword");
		List<Product> products = productService.search(keyword, 0, 20);
		productService.setSaleAndReviewNumber(products);
		request.setAttribute("ps", products);
		return "search";
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;		
	}
}
