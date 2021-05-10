package com.tmall.action;

import com.opensymphony.xwork2.ActionSupport;
import com.tmall.model.*;
import com.tmall.service.*;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
@Controller("product")
@Scope("prototype")
public class ProductAction extends ActionSupport implements ServletRequestAware{

	private HttpServletRequest request;
	@Resource
	private ReviewService reviewService;
	@Resource
	private PropertyValueService propertyValueServicee;
	@Resource
	private ProductService productService;
	@Resource
	private ProductImageService productImageService;
	@Resource
	private UserService userService;
	@Resource
	private OrderItemService orderItemService;
	private String validate;
	
	public String getValidate() {
		return validate;
	}

	public void setValidate(String validate) {
		this.validate = validate;
	}

	@Override
	public String execute() throws Exception {
		int pid = Integer.parseInt(request.getParameter("pid"));
		Product product = productService.get(pid);
		List<Review> reviews = reviewService.listById(pid);
		List<PropertyValue> propertyValues = propertyValueServicee.listById(pid);
		List<ProductImage> detailImages = productImageService.listDetailImageByp(product);
		List<ProductImage> singleImages = productImageService.listSingleImageByp(product);
		product.setProductDetailImages(detailImages);
		product.setProductSingleImages(singleImages);
		productService.setSaleAndReviewNumber(product);
		productImageService.setFirstProductImage(product);
		request.setAttribute("reviews", reviews);
	    request.setAttribute("p", product);
	    request.setAttribute("pvs", propertyValues);
		return "product";
	}
	
	public String modalLogin() throws Exception{
		String username = request.getParameter("name");
		username = HtmlUtils.htmlEscape(username);//转义防止恶意访问
		String password = request.getParameter("password");
		password = HtmlUtils.htmlEscape(password);
		User user = userService.getUserByName(username);
		if(!userService.userIsExist(username))
		{
			System.out.println("用户名错了");
			request.setAttribute("msg", "用户名或密码错误");
			return "fail";
		}else if(user.getPassword() == password){
			System.out.println("密码错了");
			request.setAttribute("msg", "用户名或密码错误");
			return "fail";
		}
		request.getSession().setAttribute("user", user);
		validate = "success";
		return SUCCESS;
	}
	
	public String buy() throws Exception{
		User user = (User) request.getSession().getAttribute("user");
		int pid = Integer.parseInt(request.getParameter("pid"));
		int num = Integer.parseInt(request.getParameter("num"));
		List<OrderItem> orderItems = orderItemService.listByUser(user.getId());
		for (OrderItem orderItem : orderItems) {
			if (orderItem.getProduct().getId() == pid) {
				orderItem.setNumber(orderItem.getNumber()+num);
				orderItemService.updateOrderItem(orderItem);
				request.setAttribute("oiid", orderItem.getId());
				return "forebuy";
			}
		}
		OrderItem orderItem2 = new OrderItem();
		orderItem2.setNumber(num);
		orderItem2.setProduct(productService.get(pid));
		orderItem2.setUser(user);
		orderItemService.addOrderItem(orderItem2);
		request.setAttribute("oiid", orderItem2.getId());
		return "forebuy";
	}
	
	public String checkLog() throws Exception{
		User user = (User) request.getSession().getAttribute("user");
		if(user!=null){
			validate = "success";
			System.out.println("拿到了");
			return SUCCESS;
		}
		return "fail";
	}
	
	public String addCart() throws Exception{
		int pid = Integer.parseInt(request.getParameter("pid"));
		int num = Integer.parseInt(request.getParameter("num"));
		Product p = productService.get(pid);
		User u = (User) request.getSession().getAttribute("user");
		List<OrderItem> orderItems = orderItemService.listByUser(u.getId());
		for (OrderItem orderItem : orderItems) {
			if (orderItem.getProduct().getId() == pid) {
				orderItem.setNumber(orderItem.getNumber()+num);
				orderItemService.updateOrderItem(orderItem);
				request.setAttribute("oiid", orderItem.getId());
				return "forebuy";
			}
		}
		OrderItem orderItem2 = new OrderItem();
		orderItem2.setNumber(num);
		orderItem2.setProduct(productService.get(pid));
		orderItem2.setUser(u);
		validate = "success";
		orderItemService.addOrderItem(orderItem2);
		return SUCCESS;
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
