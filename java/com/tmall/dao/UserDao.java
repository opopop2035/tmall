package com.tmall.dao;

import com.tmall.model.User;

public interface UserDao {
	public void addUser(User u);
	public void deleteById(int id);
	public boolean modifyUser(User u);
	public User seachByName(String username);
	public boolean userIsExist(String username);
}
