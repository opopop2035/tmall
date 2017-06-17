package com.tmall.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

//…Ã∆∑ Ù–‘
@Entity
public class PropertyValue {
	
	@Id
	@GeneratedValue
	private int id;
	private String value;
	@ManyToOne
	@JoinColumn(name="pid")
	private Product product;
	@ManyToOne
	@JoinColumn(name="ptid")
	private Property property;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Property getProperty() {
		return property;
	}
	public void setProperty(Property property) {
		this.property = property;
	}
	
}
