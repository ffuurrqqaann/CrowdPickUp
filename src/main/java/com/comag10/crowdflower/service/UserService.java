package com.comag10.crowdflower.service;

import java.util.List;

import com.comag10.crowdflower.model.Users;
import com.comag10.crowdflower.ui.model.Signup;

public interface UserService {
	 
    public void addUser(Users p);
    public void updateUser(Users p);
    public List<Users> listUsers();
    public Users getUserById(int id);
    public void removeUser(int id);
    public Users loginUser(Users u);
    public void signupUser(Signup user);
    public Boolean checkUser(Signup user);
}
