package com.tmall.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

//…Ã∆∑Õº∆¨
@Entity
public class ProductImage {
	@Id
	@GeneratedValue
	private int id;
	@ManyToOne
	@JoinColumn(name="pid")
	private Product product;
	private String type;
	@Transient public static final String type_single = "type_single";
	@Transient public static final String type_detail = "type_detail";
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
