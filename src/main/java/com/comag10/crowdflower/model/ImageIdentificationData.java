package com.comag10.crowdflower.model;

import org.hibernate.validator.constraints.NotEmpty;

public class ImageIdentificationData {
	
	private String resourceId;
	
	@NotEmpty(message = "Answer must not be empty.")
	private String answer;
	
	public String getResourceId() {
		return resourceId;
	}
	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}
	
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
}