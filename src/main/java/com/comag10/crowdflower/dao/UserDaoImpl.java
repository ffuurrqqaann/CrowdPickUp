package com.comag10.crowdflower.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.comag10.crowdflower.model.Authorities;
import com.comag10.crowdflower.model.User;


@Repository
public class UserDaoImpl implements UserDao {

	private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	public int addUser(User u) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();

		try {

			session.persist(u);
			System.out.println("user id is "+u.getId());
			//session.save(u);
		} catch( Exception e ) {
			System.out.println(e.getMessage());
		}

		return u.getId();

	}

	public void updateUser(User u) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.update(u);
		logger.info("Person updated successfully, Person Details="+u);
	}

	@SuppressWarnings("unchecked")
	public List<User> listUsers() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<User> usersList = session.createQuery(" from User").list();
		for(User p : usersList){
			logger.info("Person List::"+p);
		}
		return usersList;
	}

	public User getUserById(int id) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();      
		User p = (User) session.load(User.class, new Integer(id));
		logger.info("Person loaded successfully, Person details="+p);
		return p;
	}

	public void removeUser(int id) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		User p = (User) session.load(User.class, new Integer(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Person deleted successfully, person details="+p);
	}

	@SuppressWarnings("unchecked")
	public User authnticateUser(User u) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<User> usersList = session.createQuery(" FROM User WHERE name='"+u.getUsername()+"' AND password='"+u.getPassword()+"'").list();

		return usersList.get(0);
	}


	@SuppressWarnings("unchecked")
	public Boolean isAlreadyExistingUser(String username) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<User> usersList = session.createQuery(" FROM User WHERE username='"+username+"'").list();

		if( usersList.size()<=0 )
			return false;
		else 
			return true;
	}

	@SuppressWarnings("unchecked")
	public int getUserCoins(User u) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<User> usersList = session.createQuery(" FROM User WHERE id='"+u.getId()+"'").list();

		return usersList.get(0).getBalance();
	}

	@SuppressWarnings("unchecked")
	public User getUserByUsername(String username) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<User> usersList = session.createQuery(" FROM User WHERE username='"+username+"'").list();

		return usersList.get(0);
	}

	public Boolean updateBalance(User user, int coins) {
		// TODO Auto-generated method stub
		try {
			Session session = this.sessionFactory.getCurrentSession();
			User usr = (User)session.load(User.class, new Integer(user.getId()));
			usr.setBalance(coins);

			session.save(usr);

			return true;
		} catch(Exception e) {
			System.out.println(e.toString());
			return false;
		}
	}

	public Boolean insertUserAuthorities(Authorities au) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();

		try {
			session.persist(au);
			
			return true;
		} catch( Exception e ) {
			System.out.println(e.getMessage());
			return false;
		}
	}

}