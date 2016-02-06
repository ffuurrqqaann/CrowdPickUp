package com.comag10.crowdflower.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.comag10.crowdflower.model.Users;
import com.comag10.crowdflower.service.UserService;

@Controller
public class UserController {

	private UserService userService;

	@Autowired(required=true)
	@Qualifier(value="UserService")
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String listPersons(Model model) {
		model.addAttribute("user", new Users());
		model.addAttribute("listUsers", this.userService.listUsers());
		return "user";
	}

	//For add and update person both
    @RequestMapping(value= "/user/add", method = RequestMethod.POST)
    public String addPerson(@ModelAttribute("user") Users u){
         
        if(u.getId() == 0){
            //new person, add it
            this.userService.addUser(u);
        }else{
            //existing person, call update
            this.userService.updateUser(u);
        }
         
        return "redirect:/user";
         
    }
    
    @RequestMapping("/remove/{id}")
    public String removeUser(@PathVariable("id") int id){
         
        this.userService.removeUser(id);
        return "redirect:/user";
    }
  
    @RequestMapping("/edit/{id}")
    public String editUser(@PathVariable("id") int id, Model model){
        model.addAttribute("user", this.userService.getUserById(id));
        model.addAttribute("listUsers", this.userService.listUsers());
        return "user";
    }

}
