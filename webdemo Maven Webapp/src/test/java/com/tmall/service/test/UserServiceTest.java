package com.tmall.service.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tmall.model.User;
import com.tmall.service.UserService;


@ContextConfiguration("/beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class UserServiceTest {
	
	@Autowired
	private UserService userService;
	
	@Test
	public void addUser(){
		User user = new User();
		user.setUsername("jiaaaa");
		user.setPassword("111");
		userService.addUser(user);
	}
	@Test
	public void getUserByNameTest(){
		String username = "jiaaaa";
		User user = userService.getUserByName(username);
		System.out.println(user.getPassword());
	}
	@Test
	public void userIsExsitTest(){
		String username = "asdasd";
		System.out.println(userService.userIsExist(username));
		
	}
}
