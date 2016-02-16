package com.comag10.crowdflower.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class ApplicationHttpSessionListener implements HttpSessionListener {

	public void sessionCreated(HttpSessionEvent event) {
		// TODO Auto-generated method stub
		event.getSession().setMaxInactiveInterval(1 * 60);
		System.out.println("Session has been created.");
	}

	public void sessionDestroyed(HttpSessionEvent sessionEvnt) {
		// TODO Auto-generated method stub
		System.out.println("Session has been destroyed.");
	}

}
