package com.comag10.crowdflower.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Entity;

@Entity
@Table(name="AUTHORITIES")
public class Authorities {

	@Id
    @Column(name="authority_id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int authority_id;
	
	@Column(name="fk_user_id")
	private int fk_user_id;
	
	@Column(name="username")
	private String username;
	
	@Column(name="authority")
	private String authority;

	/**
	 * @return the authority_id
	 */
	public int getAuthority_id() {
		return authority_id;
	}

	/**
	 * @param authority_id the authority_id to set
	 */
	public void setAuthority_id(int authority_id) {
		this.authority_id = authority_id;
	}

	/**
	 * @return the fk_user_id
	 */
	public int getFk_user_id() {
		return fk_user_id;
	}

	/**
	 * @param fk_user_id the fk_user_id to set
	 */
	public void setFk_user_id(int fk_user_id) {
		this.fk_user_id = fk_user_id;
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the authority
	 */
	public String getAuthority() {
		return authority;
	}

	/**
	 * @param authority the authority to set
	 */
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
}