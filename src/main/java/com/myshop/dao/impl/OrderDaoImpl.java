package com.myshop.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myshop.dao.OrderDao;
import com.myshop.model.Order;
import com.myshop.model.Product;

@Repository
public class OrderDaoImpl implements OrderDao {
	@Autowired
	private SessionFactory factory;
	
	@Transactional
	@Override
	public Order add(Order entity) {
		Session session = factory.getCurrentSession();
		if (entity.getId() ==0){
			session.save(entity);
		}else{
			session.update(entity);
			session.flush();
		}
		return entity;
	}

	@Override
	@Transactional
	public List<Order> findAll() {
		Session session = factory.getCurrentSession();
		List<Order> results = (List<Order>)  session.createQuery("from Order").list();
		return results;
	}

	@Override
	@Transactional
	public Order findById(int id) {
		Session session = factory.getCurrentSession();
		Order order =  (Order) session.get(Order.class, id);
		return order;
	}

}
