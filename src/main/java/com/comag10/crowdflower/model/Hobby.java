package com.comag10.crowdflower.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Entity;

@Entity
@Table(name="hobbies")
//@Table(name="HOBBIES")
public class Hobby {

	@Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="status")
	private int status;
	
	@Column(name="fk_user_id")
	private int fk_user_id;
	
	@Column(name="time_taken")
	private long time_taken;
	
	@Column(name="created")
	private String created;

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
	 * @return the status
	 */
	public int getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(int status) {
		this.status = status;
	}

	/**
	 * @return the created
	 */
	public String getCreated() {
		return created;
	}

	/**
	 * @param created the created to set
	 */
	public void setCreated(String created) {
		this.created = created;
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
	 * @return the time_taken
	 */
	public long getTime_taken() {
		return time_taken;
	}

	/**
	 * @param time_taken the time_taken to set
	 */
	public void setTime_taken(long time_taken) {
		this.time_taken = time_taken;
	}
	
}