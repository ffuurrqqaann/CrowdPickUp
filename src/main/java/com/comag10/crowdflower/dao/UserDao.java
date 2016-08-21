package com.comag10.crowdflower.dao;

import java.util.List;

import com.comag10.crowdflower.model.Authorities;
import com.comag10.crowdflower.model.User;

public interface UserDao {
    public int addUser(User u);
    public void updateUser(User u);
    public List<User> listUsers();
    public User getUserById(int id);
    public void removeUser(int id);
    public User authnticateUser(User u);
    public Boolean isAlreadyExistingUser(String username);
    public int getUserCoins(User u);
    public User getUserByUsername(String username);
    public Boolean updateBalance(User user, int coins);
    public Boolean insertUserAuthorities(Authorities au);
    
}