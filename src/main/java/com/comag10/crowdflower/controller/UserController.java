package com.comag10.crowdflower.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;






import org.springframework.web.servlet.ModelAndView;

import com.comag10.crowdflower.Utils;
import com.comag10.crowdflower.model.Authorities;
import com.comag10.crowdflower.model.User;
import com.comag10.crowdflower.service.TaskService;
import com.comag10.crowdflower.service.UserService;
import com.comag10.crowdflower.ui.model.Signup;
import com.comag10.crowdflower.utilities.HibernateUtilities;
import com.comag10.crowdflower.validator.PasswordValidator;

@Controller
@SessionAttributes("user")
public class UserController {

	private UserService userService;
	private PasswordValidator passwordValidator = null;
	
	@Autowired
	private TaskService taskService;
	
	@Autowired(required=true)
	@Qualifier(value="UserService")
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public PasswordValidator getPasswordValidator() {
		return passwordValidator;
	}

	@Autowired
	public void setPasswordValidator(PasswordValidator passwordValidator) {
		this.passwordValidator = passwordValidator;
	}


	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		return "login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
		return "login";
	}

	@RequestMapping(value = "/loginFailed", method = RequestMethod.GET)
	public String loginFailed(ModelMap model) {
		//model.addAttribute("user", new Users());
		System.out.println("In login failed method");
		model.addAttribute("error", "true");
		return "login";
	}

	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView welcomePage() {

		ModelAndView model = new ModelAndView();

		model.addObject("title", "This is Crowdflow");
		model.addObject("message", "Welcome to Crowdflow");
		model.setViewName("welcome");

		return model;
	}


	@RequestMapping(value = "/tasks", method = RequestMethod.GET)
	public String tasks(Model model) {
		//get authentication from spring security context holder.
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetails = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

			String username = userDetails.getUsername();

			User user = this.userService.getUserByUsername(username);
			model.addAttribute("coins", user.getBalance());
			model.addAttribute("username", user.getUsername());
			
			Boolean isSurveySubmitted = this.taskService.checkUserSurvey(user);
			
			System.out.println("survey submitted is = "+isSurveySubmitted);
			
			if(isSurveySubmitted)
				model.addAttribute("isSurveySubmitted", "true");
			else 
				model.addAttribute("isSurveySubmitted", "false");
			
		}
		
		
		
		return "tasks";
	}

	@RequestMapping(value = "/signupUser", method = RequestMethod.GET)
	public String userSignup(Model model, HttpSession session) {

		if(session==null) {
			System.out.println("The session is null");
		} else {
			System.out.println("The session is not null");
		}

		model.addAttribute("signup", new Signup());

		return "signup";
	}

	@RequestMapping(value = "/signupUser", method = RequestMethod.POST)
	public String submitSignup(Model model, @Valid @ModelAttribute("signup") Signup signup, BindingResult result, HttpServletResponse response) {
		
		//password field validator.
		getPasswordValidator().validate(signup, result);
		
		//check if the username already taken.
		Boolean isUserAlreadyExist = this.userService.checkUser(signup);
		
		if( isUserAlreadyExist ) {
			model.addAttribute("error", "User with the same username already exists.");
			return "signup";
		} else if (result.hasErrors()) {
			return "signup";
		}
		
		//creating a new user in the system.
		try {
			User user = new User();

			user.setUsername(signup.getUsername());
			user.setPassword(Utils.MD5(signup.getPassword()));
			user.setBalance(0);
			user.setEnabled(1);

			int userId = this.userService.addUser(user);
			
			Authorities au = new Authorities();
			
			au.setAuthority("ROLE_USER");
			au.setFk_user_id(userId);
			au.setUsername(signup.getUsername());
			
			this.userService.addUserAuthorities(au);
			
			//adding signup success message.
			model.addAttribute("success", "true");
			
			//redirecting to login page after successful signup.
			return "login";

		} catch(Exception e) {
			model.addAttribute("error", e.getMessage());
			
			return "signup";
		}
	}
}