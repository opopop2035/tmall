package com.tmall.action.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.tmall.action.UserRegisterAction;
import com.tmall.vo.UserRegisterInfo;


@WebAppConfiguration
@ContextConfiguration("/beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class registerActionTest {
	@Autowired
	private UserRegisterAction userRegisterAction;
	private UserRegisterInfo registerInfo = new UserRegisterInfo();
	@Test
	public void testExecute() throws Exception{
		registerInfo.setUsername("¿Õµ÷");
		registerInfo.setPassword1("11111");
		registerInfo.setPassword2("11111");
		userRegisterAction.setUserInfo(registerInfo);
		String result = userRegisterAction.registerUser();
		System.out.println(result);
	}
}
