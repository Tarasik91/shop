package com.myshop.dao;

import java.util.List;

import javax.transaction.Transactional;

import com.myshop.model.ProductType;

public interface ProductTypeDao {

	public void add(ProductType entity);

	// public void update(Product entity);

	public ProductType findById(int id);

	public void delete(int productId);

	public List<ProductType> findAll();


}

