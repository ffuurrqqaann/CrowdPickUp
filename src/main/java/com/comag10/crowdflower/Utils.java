package com.comag10.crowdflower;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

public class Utils {

	public static String MD5(String md5) {
		try {
			java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
			byte[] array = md.digest(md5.getBytes());
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < array.length; ++i) {
				sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1,3));
			}
			return sb.toString();
		} catch (java.security.NoSuchAlgorithmException e) {
		}
		return null;
	}

	public static String getCurrentTime() {
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();

		return dateFormat.format(date);
	}

	public static long getTimeDifference(String start, String end) {
		//HH converts hour in 24 hours format (0-23), day calculation
		SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		
		long diffSeconds = 0;
		Date d1 = null;
		Date d2 = null;

		try {
			d1 = format.parse(start);
			d2 = format.parse(end);

			//in milliseconds
			long diff = d2.getTime() - d1.getTime();
			diffSeconds = diff / 1000;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return diffSeconds;
	}
	
	public static UserDetails getUserDetails() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		UserDetails userDetails = null;
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			userDetails = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		}
		
		return userDetails;
	}
}