package com.tmall.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.tmall.model.Order;
import com.tmall.model.OrderItem;
import com.tmall.model.User;
import com.tmall.service.OrderItemService;
import com.tmall.service.OrderService;

@Controller("orderAction")
@Scope("prototype")
public class orderAction extends ActionSupport implements ServletRequestAware{

	private HttpServletRequest request;
	@Resource
	private OrderService orderService;
	@Resource
	private OrderItemService orderItemService;

	@Override
	public String execute() throws Exception {
		User user =(User) request.getSession().getAttribute("user");
		List<OrderItem> ois= (List<OrderItem>) request.getSession().getAttribute("ois");
		
		String address = request.getParameter("address");
	    String post = request.getParameter("post");
	    String receiver = request.getParameter("receiver");
	    String mobile = request.getParameter("mobile");
	    String userMessage = request.getParameter("userMessage");
	    
	    Order order = new Order();
	    String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) +RandomUtils.nextInt(0, 100000);
	    
	    order.setOrderCode(orderCode);
	    order.setAddress(address);
	    order.setPostcode(post);
	    order.setReceiver(receiver);
	    order.setMobile(mobile);
	    order.setUserMessage(userMessage);
	    order.setCreateTime(new Date());
	    order.setUser(user);
	    order.setStatus(Order.waitPay);
	    orderService.addOrder(order);
	    float total =0;
	    for (OrderItem orderItem : ois) {
			orderItem.setOrder(order);
			orderItemService.updateOrderItem(orderItem);
			total += orderItem.getProduct().getBarginPrice()*orderItem.getNumber();
		}
	    request.setAttribute("total", total);
	    request.setAttribute("oid", order.getId());
		return "forealipay";
	}
	
	public String payed() throws Exception{
		int oid = Integer.parseInt(request.getParameter("oid"));
		Order order = orderService.searchByOid(oid);
		order.setStatus(Order.waitDelivery);
		order.setPayTime(new Date());
		orderService.update(order);
		request.setAttribute("o", order);
		return "payed";
	}
	
	public String bought() throws Exception{
		User user =(User) request.getSession().getAttribute("user");
		List<Order> orders = orderService.list(user.getId(), Order.delete);
		orderItemService.fill(orders);
		request.setAttribute("os", orders);
		return "bought";
	}
	
	public void deleteOrder() throws Exception{
		int oid = Integer.parseInt(request.getParameter("oid"));
		Order o = orderService.searchByOid(oid);
		o.setStatus(Order.delete);
		orderService.update(o);
	}
	
	public String confirmPay() throws Exception{
		int oid = Integer.parseInt(request.getParameter("oid"));
		Order order = orderService.searchByOid(oid);
		orderItemService.fill(order);
		request.setAttribute("o", order);
		return "confirmPay";
	}
	
	public String orderConfirmed() throws Exception{
		int oid = Integer.parseInt(request.getParameter("oid"));
		Order o = orderService.searchByOid(oid);
		o.setStatus(Order.waitReview);
		o.setConfirmTime(new Date());
		orderService.update(o);
		return "orderConfirmed";
	}
	
	public void orderpost() throws Exception{
		System.out.println("??????");
		int oid = Integer.parseInt(request.getParameter("oid"));
		Order order = orderService.searchByOid(oid);
		order.setStatus(Order.waitConfirm);
		orderService.update(order);
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
}
