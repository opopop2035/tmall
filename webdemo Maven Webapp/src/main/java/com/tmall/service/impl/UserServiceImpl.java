package com.tmall.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tmall.dao.UserDao;
import com.tmall.model.User;
import com.tmall.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Resource
	private UserDao userDao;
	
	@Override
	public void addUser(User user) {
		userDao.addUser(user);
	}
	@Override
	public User getUserByName(String username) {
		User user = userDao.seachByName(username);
		return user;
	}
	@Override
	public boolean userIsExist(String username) {
		System.out.println("service");
		return userDao.userIsExist(username);
	}
}
