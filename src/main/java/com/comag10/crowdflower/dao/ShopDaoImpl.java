package com.comag10.crowdflower.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.comag10.crowdflower.model.Purchase;


@Repository
public class ShopDaoImpl implements ShopDao {

	private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	public Boolean addNewPurchase(Purchase purchase) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();

		try {
			session.persist(purchase);
		} catch( Exception e ) {
			return false;
		}

		return true;
	}

}