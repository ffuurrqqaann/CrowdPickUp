package com.comag10.crowdflower.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="purchases")
public class Purchase {
	
	@Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="fk_user_id")
	private int fk_user_id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="created_at")
	private String created_at;

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
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
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the created_at
	 */
	public String getCreated_at() {
		return created_at;
	}

	/**
	 * @param created_at the created_at to set
	 */
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	
	
	
}
