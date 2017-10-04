package com.myshop.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.myshop.dao.ProductInOrderDao;
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
}
