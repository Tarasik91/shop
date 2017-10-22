package com.myshop.dao.impl;

import java.util.List;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.myshop.dao.ProductInOrderDao;
import com.myshop.model.Order;
import com.myshop.model.Product;
import com.myshop.model.ProductInOrder;

public class ProductInOrderDaoImpl implements ProductInOrderDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public void addProducts(List<ProductInOrder> products){
		Session session = sessionFactory.getCurrentSession();
		for(ProductInOrder pib: products){
			session.save(pib);
		}
	}

	@SuppressWarnings("unchecked")
	@Transactional
	@Override
	public List<ProductInOrder> findByProduct(Product product) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM ProductInOrder products WHERE products.product = :product");
		query.setParameter("product", product);
		return (List<ProductInOrder> ) query.list();
	}
	
	@Transactional
	@Override
	public boolean hasProduct(Product product) {
		int size = findByProduct(product).size();
		return size > 0;
	}

	@Override
	@Transactional
	public List<ProductInOrder> findByOrder(Order order) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM ProductInOrder products WHERE products.order = :order");
		query.setParameter("order", order);
		return (List<ProductInOrder> ) query.list();
	}
}
