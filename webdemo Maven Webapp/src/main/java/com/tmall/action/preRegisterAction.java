package com.tmall.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tmall.service.UserService;
import com.tmall.vo.UserRegisterInfo;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by user on 2021/4/26.
 */
@Controller("preRegisterAction")
public class preRegisterAction extends ActionSupport implements ModelDriven<UserRegisterInfo>,ServletRequestAware {

    @Resource
    private UserService userService;

    @Resource
    private HttpServletRequest request;

    private String state;

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    private UserRegisterInfo userInfo = new UserRegisterInfo();

//    public UserRegisterInfo getUserInfo() {
//        return userInfo;
//    }
//
//    public void setUserInfo(UserRegisterInfo userInfo) {
//        this.userInfo = userInfo;
//    }

    @Override
    public String execute() throws Exception {
        if (userService.getUserByName(userInfo.getUsername()) != null) {
            state = "isExist";
            return "exist";
        }
        state = "usable";
        return "exist";
    }

    @Override
    public UserRegisterInfo getModel() {
        return userInfo;
    }

    @Override
    public void setServletRequest(HttpServletRequest request) {
        this.request = request;
    }
}
