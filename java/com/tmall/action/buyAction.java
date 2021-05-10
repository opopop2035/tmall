package com.tmall.action;

import com.opensymphony.xwork2.ActionSupport;
import com.tmall.model.OrderItem;
import com.tmall.service.OrderItemService;
import com.tmall.service.ProductImageService;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller("buyAction")
@Scope("prototype")
public class buyAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	@Resource
	private OrderItemService orderItemService;
	@Resource
	private ProductImageService productImageService;
	
	
	@Override
	public String execute() throws Exception {
		List<OrderItem> ois = new ArrayList<OrderItem>();
		float total = 0;
		if (request.getAttribute("oiid") instanceof Integer) {
			Integer oiid = (Integer) request.getAttribute("oiid");
			OrderItem oi = orderItemService.listByOiid(oiid);
			total+=oi.getProduct().getBarginPrice()*oi.getNumber();
			productImageService.setFirstProductImage(oi.getProduct());
			ois.add(oi);
		}else{
			String[] oiids = request.getParameterValues("oiid");
			for (String strid : oiids) {
		        int oiid = Integer.parseInt(strid);
		        OrderItem oi = orderItemService.listByOiid(oiid);
		        total +=oi.getProduct().getBarginPrice()*oi.getNumber();
		        productImageService.setFirstProductImage(oi.getProduct());
		        ois.add(oi);
		    }
		}
		request.getSession().setAttribute("ois", ois);
		request.setAttribute("total", total);
		return "buyPage";
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}


}
