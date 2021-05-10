package com.tmall.vo;

import java.io.Serializable;

public class UserRegisterInfo implements Serializable{
	private int id;
	private String username;
	private String password1;
	private String password2;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword1() {
		return password1;
	}
	public void setPassword1(String password1) {
		this.password1 = password1;
	}
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	public UserRegisterInfo() {
	}
	public UserRegisterInfo(int id, String username, String password1, String password2) {
		super();
		this.id = id;
		this.username = username;
		this.password1 = password1;
		this.password2 = password2;
	}
	
}
