package com.tmall.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tmall.model.User;
import com.tmall.service.UserService;
import com.tmall.vo.UserRegisterInfo;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller("userRegister")
@Scope("prototype")
public class UserRegisterAction extends ActionSupport implements ModelDriven<UserRegisterInfo>,ServletRequestAware {

	@Resource
	private UserService userService;
	@Resource
	private HttpServletRequest request;
//	private String state;
//
//	public String getState() {
//		return state;
//	}
//
//	public void setState(String state) {
//		this.state = state;
//	}
//
	private UserRegisterInfo userInfo = new UserRegisterInfo();//用ModelDriven需要new一个

	public UserRegisterInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserRegisterInfo userInfo) {
		this.userInfo = userInfo;
	}

	@Override
	public String execute() throws Exception{
		return registerUser();
	}

	public String registerUser(){
		try {
			User user = new User();
			// System.out.println(userService);
			user.setPassword(HtmlUtils.htmlEscape(userInfo.getPassword1()));
			user.setUsername(HtmlUtils.htmlEscape(userInfo.getUsername()));
			// System.out.println(userInfo.getUsername());
			userService.addUser(user);
			request.getSession().setAttribute("user", user);
			return "index";
		} catch (Exception e) {
			return ERROR;
		}
	}
//	public String getUserState() {
//		if (userService.getUserByName(userInfo.getUsername()) != null) {
//			state = "isExist";
//			return "exist";
//		}
//		state = "usable";
//		return "exist";
//	}
//	@Override
//	public void validate() {//验证
//		if (userService.userIsExist(userInfo.getUsername())){
//			this.addActionError("用户名已存在");
//		}
//		this.addActionMessage("用户名可以使用");
//	}


	@Override
	public UserRegisterInfo getModel() {
		return userInfo;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

}
