package com.tmall.service;

import com.tmall.model.User;

public interface UserService {
	public void addUser(User user);
	public User getUserByName(String username);
	public boolean userIsExist(String username);
}
