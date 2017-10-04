package com.myshop.dao;

import java.util.List;

import com.myshop.model.ProductInOrder;

public interface ProductInOrderDao {
	public void addProducts(List<ProductInOrder> products);
}
