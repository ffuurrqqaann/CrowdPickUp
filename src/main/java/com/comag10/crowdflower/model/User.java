package com.comag10.crowdflower.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Entity;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="users")
//@Table(name="USERS")
public class User {

	@Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="username")
	@NotEmpty(message="Username must not be empty.")
	private String username;
	
	@NotEmpty(message="Password must not be empty.")
	@Column(name="password")
	private String password;
	
	@Column(name="balance")
	private int balance;
	
	@Column(name="enabled")
	private int enabled;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "fk_user_id")
	private Set<ImageIdentificationDeliverable> imageIdentificationDeliverable;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	
	public Set<ImageIdentificationDeliverable> getImageIdentificationDeliverable() {
		return imageIdentificationDeliverable;
	}
	public void setImageIdentificationDeliverable(
			Set<ImageIdentificationDeliverable> imageIdentificationDeliverable) {
		this.imageIdentificationDeliverable = imageIdentificationDeliverable;
	}
}