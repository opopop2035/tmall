package com.tmall.util.intercepror;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.tmall.model.User;

public class vaildateLogin extends AbstractInterceptor{
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
		ActionContext actionContext =  invocation.getInvocationContext();
		HttpServletRequest request = (HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
		User user = (User) request.getSession().getAttribute("user");
		if(user == null){
			return "login";
		}
		return invocation.invoke();
	}

	
}
