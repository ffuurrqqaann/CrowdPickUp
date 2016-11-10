package com.comag10.crowdflower.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.comag10.crowdflower.Utils;
import com.comag10.crowdflower.dao.ShopDao;
import com.comag10.crowdflower.model.Purchase;
import com.comag10.crowdflower.model.User;


@Service("ShopService")
public class ShopServiceImpl implements ShopService {

	
	@Autowired
	private ShopDao shopDAO;

	public void setShopDAO(ShopDao shopDAO) {
		this.shopDAO = shopDAO;
	}
	
	@Transactional
	public Boolean purchase(User user, String name) {
		// TODO Auto-generated method stub
		
		Purchase purchase = new Purchase();
		
		purchase.setName(name);
		purchase.setFk_user_id(user.getId());
		purchase.setCreated_at(Utils.getCurrentTime());
		
		try {
			this.shopDAO.addNewPurchase(purchase);
			
			return true;
		} catch(Exception e) {
			System.out.println(e.getMessage().toString());
			return false;
		}
	}
	
}