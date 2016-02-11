package com.comag10.crowdflower.dao;

import java.util.List;

import com.comag10.crowdflower.model.Users;

public interface UserDao {
	 
    public void addUser(Users u);
    public void updateUser(Users u);
    public List<Users> listUsers();
    public Users getUserById(int id);
    public void removeUser(int id);
    public Users authnticateUser(Users u);
    public Boolean isAlreadyExistingUser(String username);
}