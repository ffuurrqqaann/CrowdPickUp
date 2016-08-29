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
import com.comag10.crowdflower.service.UserService;
import com.comag10.crowdflower.shared.Constants;

@Controller
public class ShopController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/shop")
	public String loadShop (Model model) {
		//free coffee ticket data.
		model.addAttribute("freeCoffeeDescription", Constants.COFFEE_TICKET_DESCRIPTION);
		model.addAttribute("coffeeImage", "images/shop/coffee-ticket.gif");
		model.addAttribute("freeCoffeeCost", Constants.COFFEE_TICKET);

		//free lunch coupon data.
		model.addAttribute("freeLunchDescription", Constants.FREE_LUNCH_COUPON_DESCRIPTION);
		model.addAttribute("lunchImage", "images/shop/lunch-ticket.png");
		model.addAttribute("freelunchCost", Constants.FREE_LUNCH_COUPON);

		//free burger king coupon data.
		model.addAttribute("burgerKingDescription", Constants.BURGER_KING_COUPON_DESCRIPTION);
		model.addAttribute("burgerKingImage", "images/shop/burger-king-coupon.jpg");
		model.addAttribute("freeBurgerCost", Constants.BURGER_KING_COUPON);

		return "shop";
	}

	@ResponseBody
	@RequestMapping(value="/purchase")
	public String purchaseItem (Model model, @RequestParam("cost") String cost, Principal principal) {

		//get current user id from user info.
		String username = principal.getName();
		User user = this.userService.getUserByUsername(username);
		
		int userCurrentBalance = user.getBalance();
		int itemCost = Integer.parseInt(cost);
		
		if( itemCost>userCurrentBalance )
			return "{\"status\":\"405\", \"message\":\"You dont have enough coins to purchase this item. Please perform tasks to earn coins.\"}";
		
		int remainingBalance =userCurrentBalance - itemCost;
		
		/*User u = new User();*/
		user.setBalance(remainingBalance);
		
		Boolean isUserUpdated = this.userService.updateUser(user);
		
		if (isUserUpdated) {
			return "{\"status\":\"200\", \"message\":\"You have successfully purchased the item. Please send an email to admin@comag10.com to fix an appointment and claim your prize.Thanks!!!\"}";
		}
		
		return "shop";
	}

}