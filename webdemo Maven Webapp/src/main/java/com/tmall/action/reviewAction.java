package com.tmall.action;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

import com.opensymphony.xwork2.ActionSupport;
import com.tmall.model.Order;
import com.tmall.model.Product;
import com.tmall.model.Review;
import com.tmall.model.User;
import com.tmall.service.OrderItemService;
import com.tmall.service.OrderService;
import com.tmall.service.ProductImageService;
import com.tmall.service.ProductService;
import com.tmall.service.ReviewService;
@Controller("review")
@Scope("prototype")
public class reviewAction  extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	@Resource
	private OrderService orderService;
	@Resource
	private OrderItemService orderItemService;
	@Resource
	private ReviewService reviewService;
	@Resource
	private ProductService productService;
	@Resource
	private ProductImageService productImageService;
	@Override
	public String execute() throws Exception {
		int oid = Integer.parseInt(request.getParameter("oid"));
		Order o = orderService.searchByOid(oid);
		orderItemService.fill(o);
		Product p = o.getOrderItems().get(0).getProduct();
		productImageService.setFirstProductImage(p);
		List<Review> reviews = reviewService.listById(p.getId());
		productService.setSaleAndReviewNumber(p);
		request.setAttribute("p", p);
		request.setAttribute("o", o);
		request.setAttribute("reviews", reviews);
		return "review";
	}
	
	public String doreview() throws Exception{
		int oid = Integer.parseInt(request.getParameter("oid"));
		Order o = orderService.searchByOid(oid);
		o.setStatus(Order.finish);
		orderService.update(o);
		int pid = Integer.parseInt(request.getParameter("pid"));
		Product p = productService.get(pid);
		String content = request.getParameter("content");
		content = HtmlUtils.htmlEscape(content);
		User user =(User) request.getSession().getAttribute("user");
		Review review = new Review();
		review.setContent(content);
		review.setProduct(p);
		review.setUser(user);
		review.setCreateDate(new Date());
		productImageService.setFirstProductImage(p);
		reviewService.addReview(review);
		request.setAttribute("oid", oid);
		request.setAttribute("showonly", true);
		return "forereview";
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
