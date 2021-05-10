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
		String username = request.getParameter("userName");//��JSP��ȡ�û���
		username = HtmlUtils.htmlEscape(username);//ת���ֹ�������
		String password = request.getParameter("password");//��JSP��ȡ����
		password = HtmlUtils.htmlEscape(password);

		if (!userService.userIsExist(username)) {
			System.out.println("�û�������");
			request.setAttribute("msg", "�û������������");
			return "login";
		}

		User user = userService.getUserByName(username);//�����û�����ȡ��ȷ����

		if (!user.getPassword().equals(password)) {
				System.out.println("�������");
				request.setAttribute("msg", "�û������������");
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
