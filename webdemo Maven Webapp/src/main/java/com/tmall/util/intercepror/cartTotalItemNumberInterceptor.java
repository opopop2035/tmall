package com.tmall.util.intercepror;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.tmall.model.OrderItem;
import com.tmall.model.User;
import com.tmall.service.OrderItemService;
import org.apache.struts2.StrutsStatics;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
public class cartTotalItemNumberInterceptor extends AbstractInterceptor{
	
	@Resource
	private OrderItemService orderItemService;
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
		ActionContext actionContext =  invocation.getInvocationContext();
		HttpServletRequest request = (HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
		User user =(User) request.getSession().getAttribute("user");
		int cartTotalItemNumber = 0;
		if (user!=null) {
			List<OrderItem> ois = orderItemService.listByUser(user.getId());
			for (OrderItem orderItem : ois) {
				cartTotalItemNumber += orderItem.getNumber();
			}
		}
		request.setAttribute("cartTotalItemNumber", cartTotalItemNumber);
		return invocation.invoke();
	}

	
}
