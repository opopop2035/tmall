package com.tmall.action;

import com.opensymphony.xwork2.ActionSupport;
import com.tmall.model.User;
import com.tmall.service.UserService;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller("login")
@Scope("prototype")
public class loginAction  extends ActionSupport implements ServletRequestAware{

	private HttpServletRequest request;
	
	@Resource
	private UserService userService;
	
	@Override
	public String execute() throws Exception {
		String username = request.getParameter("userName");//从JSP获取用户名
		username = HtmlUtils.htmlEscape(username);//转义防止恶意访问
		String password = request.getParameter("password");//从JSP获取密码
		password = HtmlUtils.htmlEscape(password);

		if (!userService.userIsExist(username)) {
			System.out.println("用户名错了");
			request.setAttribute("msg", "用户名或密码错误");
			return "login";
		}

		User user = userService.getUserByName(username);//根据用户名获取正确密码

		if (!user.getPassword().equals(password)) {
				System.out.println("密码错了");
				request.setAttribute("msg", "用户名或密码错误");
				return "login";
			}
			request.getSession().setAttribute("user", user);
			return SUCCESS;

	}
	
	
	public String logout() throws Exception{
		request.getSession().removeAttribute("user");
		return "logout";
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;	
	}

}
