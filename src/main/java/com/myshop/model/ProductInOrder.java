package com.myshop.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "product_in_order")
public class ProductInOrder {
	@Id
	@Column(name = "id")
	@GeneratedValue
	private int id;

	@OneToOne
	@JoinColumn(name = "product_id", referencedColumnName = "id")
	Product product;

	@Column(name = "quantity")
	private int quantity;
	
	@Column(name = "price")
	private double price;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "order_id")
	Order order;

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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
	
}
