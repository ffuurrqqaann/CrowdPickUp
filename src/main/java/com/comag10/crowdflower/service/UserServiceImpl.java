package com.comag10.crowdflower.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.comag10.crowdflower.dao.UserDao;
import com.comag10.crowdflower.model.Users;


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
}