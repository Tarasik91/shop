package com.myshop.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myshop.dao.ProductTypeDao;
import com.myshop.model.ProductType;

@Transactional
@Repository
public class ProductTypeDaoImpl implements ProductTypeDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void add(ProductType product) {
		Session session = sessionFactory.getCurrentSession();
		if (product.getId() == 0) {
			session.save(product);
		} else {
			session.update(product);
			session.flush();
		}
	}

	@Override
	@Transactional
	public List<ProductType> findAll() {
		Session session = sessionFactory.getCurrentSession();
		List<ProductType> result = (List<ProductType>) session.createQuery("from ProductType").list();

		return result;
	}

	@Override
	public void delete(int productId) {
		Session session = sessionFactory.openSession();
		ProductType product = (ProductType) session.load(ProductType.class, productId);
		if (null != product) {
			session.delete(product);
		}
		session.flush();
	}

	@Override
	@Transactional
	public ProductType findById(int productId) {
		Session session = sessionFactory.getCurrentSession();
		ProductType productType = (ProductType) session.get(ProductType.class, productId);
		return productType;
	}

}
