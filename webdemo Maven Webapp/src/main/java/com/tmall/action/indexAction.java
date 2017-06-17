package com.tmall.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.tmall.model.Category;
import com.tmall.service.CategoryService;

@Controller("indexAction")
@Scope("prototype")
public class indexAction extends ActionSupport implements ServletRequestAware{
	@Resource
	private CategoryService categoryService;
	
	private HttpServletRequest request;
	@Override
	public String execute() throws Exception {
		
		List<Category> categorys = categoryService.listCategory();
		categorys= categoryService.listByRow(categorys);
		request.setAttribute("categorysByRow", categorys);
		return "index";
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
