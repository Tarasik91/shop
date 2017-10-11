package com.myshop.dao.impl;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myshop.dao.ProductDao;
import com.myshop.model.Product;
import com.myshop.util.Constants;
import com.myshop.util.PaginationModel;

@Repository

public class ProductDaoImpl implements ProductDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	@Override
	public void add(Product product) {
		Session session = sessionFactory.getCurrentSession();
		if (product.getId() == 0){
			session.save(product);
		}else{
			session.update(product);
			session.flush();
		}
	}

	@Transactional
	@Override
	public List<Product> findAll() {
		Session session = sessionFactory.getCurrentSession();
		List<Product> result =(List<Product>) session.createQuery("from Product").list();
		return result;
	}

	@Transactional
	@Override
	public void delete(int productId) {
		Session session = sessionFactory.getCurrentSession();
		Product product = (Product) session.load(Product.class, productId);
		if (null != product) {
			session.delete(product);
		}
		session.flush();
	}

	@Transactional
	@Override
	public Product findById(int productId) {
		Session session = sessionFactory.getCurrentSession();
		Product product = (Product) session.get(Product.class, productId);
		return product;
	}

	@Transactional
	@Override
	public List<Product> findByIds(Set<Integer> ids) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Product item WHERE item.id IN (:ids)");
		query.setParameterList("ids", ids);
		return query.list();
	}

	@Override
	@Transactional
	public PaginationModel<Product> findByTypeAndPage(int typeId, int pageNumber) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Product item WHERE item.productType.id = :type");
		query.setFirstResult(pageNumber);
		query.setMaxResults(Constants.PAGE_SIZE);
		query.setParameter("type", typeId);
	
		PaginationModel<Product> model = new PaginationModel<>();
		model.setList(query.list());
		model.setPage(pageNumber);
		String countQ = "Select count (p.id) from Product p WHERE p.productType.id = :type";
		Query countQuery = session.createQuery(countQ);
		countQuery.setParameter("type", typeId);
		long countResults = (Long) countQuery.uniqueResult();
		model.setCount((int)countResults);
		return model;
	}
}
