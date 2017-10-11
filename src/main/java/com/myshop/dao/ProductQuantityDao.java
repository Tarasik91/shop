package com.myshop.dao;

import java.util.List;

import com.myshop.model.Product;
import com.myshop.model.ProductQuantity;

public interface ProductQuantityDao {
	public void save(ProductQuantity quantity);
	public void save(List<ProductQuantity> list);
	public List<ProductQuantity> findByProduct(Product product);
	
}
