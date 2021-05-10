package com.tmall.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


//¶©µ¥Ïî
@Entity
public class OrderItem {
	@Id
	@GeneratedValue
	private int id;
	@ManyToOne
	@JoinColumn(name="pid")
	private Product product;
	@ManyToOne
	@JoinColumn(name="uid")
	private User user;
	@ManyToOne(optional=true)
	@JoinColumn(name="oid")
	private Order order;
	private int number;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	
}
