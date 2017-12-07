package com.myshop.dao;

import java.util.List;

import javax.transaction.Transactional;

import com.myshop.model.Product;
import com.myshop.model.ProductComment;

public interface ProductCommentDao {
	@Transactional
	ProductComment save(ProductComment comment);

	@Transactional
	List<ProductComment> findByProduct(Product product);
}
