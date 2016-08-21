package com.comag10.crowdflower.service;

import java.util.List;

import com.comag10.crowdflower.model.Authorities;
import com.comag10.crowdflower.model.User;
import com.comag10.crowdflower.ui.model.Signup;

public interface UserService {
	 
    public int addUser(User p);
    public Boolean updateUser(User p);
    public List<User> listUsers();
    public User getUserById(int id);
    public void removeUser(int id);
    public User loginUser(User u);
    public void signupUser(Signup user);
    public Boolean checkUser(Signup user);
    public int getUserCoins(User u);
    public User getUserByUsername(String username);
    public Boolean updateUserBalance(User user, int coins);
    public Boolean addUserAuthorities(Authorities au);
    
}
