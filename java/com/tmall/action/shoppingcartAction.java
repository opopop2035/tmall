package com.tmall.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.tmall.model.OrderItem;
import com.tmall.model.User;
import com.tmall.service.OrderItemService;
import com.tmall.service.ProductImageService;

@Controller("shoppingcartAction")
@Scope("prototype")
public class shoppingcartAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	@Resource
	private OrderItemService orderItemService;
	@Resource
	private ProductImageService productImageService;
	
	@Override
	public String execute() throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		List<OrderItem> ois = orderItemService.listByUser(user.getId());
		
		for (OrderItem orderItem : ois) {
			productImageService.setFirstProductImage(orderItem.getProduct());
		}
		request.setAttribute("ois", ois);
		return SUCCESS;
	}
	
	public String changeOrderItem() throws Exception{
		User user = (User) request.getSession().getAttribute("user");
		if (user==null) {
			return "login";
		}
		int pid = Integer.parseInt(request.getParameter("pid"));
	    int number = Integer.parseInt(request.getParameter("number"));
	    List<OrderItem> ois = orderItemService.listByUser(user.getId());
	    for (OrderItem orderItem : ois) {
			if (orderItem.getProduct().getId() == pid) {
				orderItem.setNumber(number);
				orderItemService.updateOrderItem(orderItem);
				break;
			}
		}
	    return SUCCESS;
	}
	
	public void deleteOrderItem() throws Exception{
		int oiid = Integer.parseInt(request.getParameter("oiid"));
	    orderItemService.deleteOrderItem(orderItemService.listByOiid(oiid));
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
