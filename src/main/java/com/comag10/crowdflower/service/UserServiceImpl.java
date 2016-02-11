package com.comag10.crowdflower.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.comag10.crowdflower.Utils;
import com.comag10.crowdflower.dao.UserDao;
import com.comag10.crowdflower.model.Users;
import com.comag10.crowdflower.ui.model.Signup;


@Service("UserService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDAO;
	
	public void setUserDAO(UserDao userDAO) {
		this.userDAO = userDAO;
	}
	
	@Transactional
	public void addUser(Users u) {
		// TODO Auto-generated method stub
		this.userDAO.addUser(u);
	}
	@Transactional
	public void updateUser(Users u) {
		// TODO Auto-generated method stub
		this.userDAO.updateUser(u);
	}
	@Transactional
	public List<Users> listUsers() {
		// TODO Auto-generated method stub
		
		if( this.userDAO == null ) {
			System.out.print("object is null");
		} else {
			System.out.print("object is not null");
		}
		
		return this.userDAO.listUsers();
	}
	@Transactional
	public Users getUserById(int id) {
		// TODO Auto-generated method stub
		
		return this.userDAO.getUserById(id);
	}
	@Transactional
	public void removeUser(int id) {
		// TODO Auto-generated method stub
		this.userDAO.removeUser(id);
	}
	
	@Transactional
	public Users loginUser(Users u) {
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
	
	
	
	
}