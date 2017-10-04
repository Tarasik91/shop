package com.myshop.dao;

import java.util.List;

import com.myshop.model.Order;

public interface OrderDao {
	public Order add(Order entity);
	
	public List<Order> findAll();
}
