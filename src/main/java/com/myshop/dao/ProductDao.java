package com.myshop.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import com.myshop.model.Product;
import com.myshop.util.PaginationModel;

public interface ProductDao {

	public void add(Product entity);

	// public void update(Product entity);

	public Product findById(int id);
	
	public List<Product> findByIds(Set<Integer> ids);
	
	public PaginationModel<Product> findByTypeAndPage(int type, int page);
	
	public void delete(int productId);

	public List<Product> findAll();
	
	public List<Product> findByRating();

}
