package com.comag10.crowdflower.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import com.comag10.crowdflower.ui.model.Signup;

@Component
public class PasswordValidator implements org.springframework.validation.Validator {

	public boolean supports(Class<?> c) {
		// TODO Auto-generated method stub
		return Signup.class.isAssignableFrom(c);
	}

	public void validate(Object command, Errors errors) {
		// TODO Auto-generated method stub
		Signup signup = (Signup) command;
		
		if(!signup.getPassword().equals(signup.getConfirmPassword()))
			errors.rejectValue("confirmPassword", "password.notmatch");
	}
	
}