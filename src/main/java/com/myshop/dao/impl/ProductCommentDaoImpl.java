package com.myshop.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myshop.dao.ProductCommentDao;
import com.myshop.model.Product;
import com.myshop.model.ProductComment;

@Repository
public class ProductCommentDaoImpl implements ProductCommentDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Transactional
	@Override
	public ProductComment save(ProductComment comment) {
		Session session = sessionFactory.getCurrentSession();
		if (comment.getId() == 0){
			session.save(comment);
		}else{
			session.update(comment);
			session.flush();
		}
		return comment;
	}

	@Override
	public List<ProductComment> findByProduct(Product product) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM ProductComment comment WHERE comment.product = :product ");
		query.setParameter("product", product);
		return query.list();
	}

}
