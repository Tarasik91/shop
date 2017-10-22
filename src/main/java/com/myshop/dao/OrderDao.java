package com.myshop.dao;

import java.util.List;

import com.myshop.model.Order;
import com.myshop.model.enums.OrderStatus;

public interface OrderDao {
	public Order add(Order entity);
	
	public List<Order> findAll();
	
	public Order findById(int id);
	
	public void updateStatus(int id, OrderStatus status);
}
