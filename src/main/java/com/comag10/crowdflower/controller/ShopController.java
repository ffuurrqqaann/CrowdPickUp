package com.comag10.crowdflower.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comag10.crowdflower.model.User;
import com.comag10.crowdflower.service.ShopService;
import com.comag10.crowdflower.service.UserService;
import com.comag10.crowdflower.shared.Constants;

@Controller
public class ShopController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ShopService shopService;
	
	@RequestMapping(value="/shop")
	public String loadShop (Model model) {
		return "shop";
	}

	@ResponseBody
	@RequestMapping(value="/purchase")
	public String purchaseItem (Model model, @RequestParam("cost") String cost, @RequestParam("name") String name, Principal principal) {

		//get current user id from user info.
		String username = principal.getName();
		User user = this.userService.getUserByUsername(username);
		
		int userCurrentBalance = user.getBalance();
		int itemCost = Integer.parseInt(cost);
		
		if( itemCost>userCurrentBalance )
			return "{\"status\":\"405\", \"message\":\"You dont have enough coins to purchase this item. Please perform tasks to earn coins.\"}";
		
		int remainingBalance =userCurrentBalance - itemCost;
		
		user.setBalance(remainingBalance);
		
		Boolean isUserUpdated = this.userService.updateUser(user);
		
		if (isUserUpdated) {
			this.shopService.purchase(user, name);
			return "{\"status\":\"200\", \"message\":\"You have successfully purchased the item. Please send an email to furqan.ahmed@student.oulu.fi (cc: Jorge.Goncalves@oulu.fi) to fix an appointment and claim your prize.Thanks!!!\"}";
		}
		
		return "shop";
	}

}