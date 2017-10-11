package com.myshop.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.myshop.dao.ProductQuantityDao;
import com.myshop.model.Product;
import com.myshop.model.ProductQuantity;

public class ProductQuantityDaoImpl implements ProductQuantityDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	@Override
	public void save(ProductQuantity quantity) {
		Session session = sessionFactory.getCurrentSession();
		if (quantity.getId() == 0){
			session.save(quantity);
		}else{
			session.update(quantity);
			session.flush();
		}
	}
	
	@Transactional
	@Override
	public void save(List<ProductQuantity> list) {
		for(ProductQuantity quantity : list){
			save(quantity);
		}
	}

	@Transactional
	@Override
	public List<ProductQuantity> findByProduct(Product product) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM ProductQuantity quantity WHERE quantity.product = :product");
		query.setParameter("product", product);
		return (List<ProductQuantity> ) query.list();
	}
}
