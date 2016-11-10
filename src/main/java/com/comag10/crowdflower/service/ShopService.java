package com.comag10.crowdflower.service;

import com.comag10.crowdflower.model.User;

public interface ShopService {
	
	public Boolean purchase(User user, String name);
	
}