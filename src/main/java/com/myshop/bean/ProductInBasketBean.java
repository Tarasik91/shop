package com.myshop.bean;

public class ProductInBasketBean {
	private int quantity;
	private int productId;
	private double price;
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	public ProductInBasketBean(int quantity, int productId, double price) {
		super();
		this.quantity = quantity;
		this.productId = productId;
		this.price = price;
	}
	public ProductInBasketBean(){}
	@Override
	public String toString() {
		return "ProductInBasketBean [quantity=" + quantity + ", productId=" + productId + ", price=" + price + "]";
	};
	
	
}
