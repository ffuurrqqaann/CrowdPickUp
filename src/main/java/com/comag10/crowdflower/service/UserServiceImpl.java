package com.comag10.crowdflower.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.comag10.crowdflower.Utils;
import com.comag10.crowdflower.dao.UserDao;
import com.comag10.crowdflower.model.Authorities;
import com.comag10.crowdflower.model.User;
import com.comag10.crowdflower.ui.model.Signup;


@Service("UserService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDAO;

	public void setUserDAO(UserDao userDAO) {
		this.userDAO = userDAO;
	}

	@Transactional
	public int addUser(User u) {
		// TODO Auto-generated method stub
		return this.userDAO.addUser(u);
	}
	@Transactional
	public Boolean updateUser(User u) {
		// TODO Auto-generated method stub
		try {
			this.userDAO.updateUser(u);
			return true;
		} catch(Exception e) {
			return false;
		}
	}
	@Transactional
	public List<User> listUsers() {
		// TODO Auto-generated method stub

		if( this.userDAO == null ) {
			System.out.print("object is null");
		} else {
			System.out.print("object is not null");
		}

		return this.userDAO.listUsers();
	}
	@Transactional
	public User getUserById(int id) {
		// TODO Auto-generated method stub

		return this.userDAO.getUserById(id);
	}
	@Transactional
	public void removeUser(int id) {
		// TODO Auto-generated method stub
		this.userDAO.removeUser(id);
	}

	@Transactional
	public User loginUser(User u) {
		// TODO Auto-generated method stub

		String password = u.getPassword();
		password = Utils.MD5(password);

		u.setPassword(password);
		return this.userDAO.authnticateUser(u);
	}

	public void signupUser(Signup user) {
		// TODO Auto-generated method stub

	}

	@Transactional
	public Boolean checkUser(Signup user) {
		// TODO Auto-generated method stub
		return this.userDAO.isAlreadyExistingUser(user.getUsername());
	}

	public int getUserCoins(User u) {
		// TODO Auto-generated method stub
		int coins = this.userDAO.getUserCoins(u);

		return coins;
	}

	@Transactional
	public User getUserByUsername(String username) {
		// TODO Auto-generated method stub
		User user = this.userDAO.getUserByUsername(username);

		return user;
	}

	@Transactional
	public Boolean updateUserBalance(User user, int coins) {
		// TODO Auto-generated method stub
		int currentBalance = this.userDAO.getUserCoins(user);
		currentBalance+=coins;

		try {
			this.userDAO.updateBalance(user, currentBalance);

			return true;
		} catch(Exception e) {
			System.out.println(e.getMessage().toString());
			return false;
		}
	}
	
	@Transactional
	public Boolean addUserAuthorities(Authorities au) {
		// TODO Auto-generated method stub
		try {
			this.userDAO.insertUserAuthorities(au);
			
			return true;
		} catch(Exception e) {
			System.out.println(e.getMessage().toString());
			return false;
		}
	}
}