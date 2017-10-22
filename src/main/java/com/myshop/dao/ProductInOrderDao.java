package com.myshop.dao;

import java.util.List;

import com.myshop.model.Order;
import com.myshop.model.Product;
import com.myshop.model.ProductInOrder;

public interface ProductInOrderDao {
	public void addProducts(List<ProductInOrder> products);
	
	public List<ProductInOrder> findByProduct(Product product);
	
	public boolean hasProduct(Product product);
	
	public List<ProductInOrder> findByOrder(Order order);
}
