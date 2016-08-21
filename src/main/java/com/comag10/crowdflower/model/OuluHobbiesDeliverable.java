package com.comag10.crowdflower.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Entity;

@Entity
@Table(name="OULU_HOBBIES_DELIVERABLES")
public class OuluHobbiesDeliverable {

	@Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "fk_user_id")
	private int fk_user_id;
	
	@Column(name="answer")
	private String answer;
	
	@Column(name="fk_hobby_id")
	private int fk_hobby_id;
	
	@Column(name="time_taken")
	private long time_taken;
	
	@Column(name="skipped")
	private int skipped;
	
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
	 * @return the answer
	 */
	public String getAnswer() {
		return answer;
	}

	/**
	 * @param answer the answer to set
	 */
	public void setAnswer(String answer) {
		this.answer = answer;
	}

	/**
	 * @return the fk_hobby_id
	 */
	public int getFk_hobby_id() {
		return fk_hobby_id;
	}

	/**
	 * @param fk_hobby_id the fk_hobby_id to set
	 */
	public void setFk_hobby_id(int fk_hobby_id) {
		this.fk_hobby_id = fk_hobby_id;
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

	/**
	 * @return the skipped
	 */
	public int getSkipped() {
		return skipped;
	}

	/**
	 * @param skipped the skipped to set
	 */
	public void setSkipped(int skipped) {
		this.skipped = skipped;
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
	
	
	
}