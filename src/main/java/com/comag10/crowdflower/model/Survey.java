package com.comag10.crowdflower.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Entity;

@Entity
@Table(name="survey_deliverables")
public class Survey {

	@Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="fk_user_id")
	private int fk_user_id;
	
	@Column(name="gender")
	private String gender;
	
	@Column(name="age")
	private String age;
	
	@Column(name="education")
	private int education;
	
	@Column(name="field_study")
	private int field_study;
	
	@Column(name="living")
	private int living;
	
	@Column(name="is_crowdsourcing_worker")
	private int is_crowdsourcing_worker;
	
	@Column(name="is_reserved")
	private int is_reserved;
	
	@Column(name="is_generally_trusting")
	private int is_generally_trusting;
	
	@Column(name="lazy")
	private int lazy;
	
	@Column(name="relaxed")
	private int relaxed;
	
	@Column(name="artistic_interest")
	private int artistic_interest;
	
	@Column(name="sociable")
	private int sociable;
	
	@Column(name="find_faults")
	private int find_faults;
	
	@Column(name="thorough_job")
	private int thorough_job;
	
	@Column(name="nervous")
	private int nervous;
	
	@Column(name="active_imagination")
	private int active_imagination;

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
	 * @return the gender
	 */
	public String getGender() {
		return gender;
	}

	/**
	 * @param gender the gender to set
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}

	/**
	 * @return the age
	 */
	public String getAge() {
		return age;
	}

	/**
	 * @param age the age to set
	 */
	public void setAge(String age) {
		this.age = age;
	}

	/**
	 * @return the education
	 */
	public int getEducation() {
		return education;
	}

	/**
	 * @param education the education to set
	 */
	public void setEducation(int education) {
		this.education = education;
	}

	/**
	 * @return the field_study
	 */
	public int getField_study() {
		return field_study;
	}

	/**
	 * @param field_study the field_study to set
	 */
	public void setField_study(int field_study) {
		this.field_study = field_study;
	}

	/**
	 * @return the living
	 */
	public int getLiving() {
		return living;
	}

	/**
	 * @param living the living to set
	 */
	public void setLiving(int living) {
		this.living = living;
	}

	/**
	 * @return the is_crowdsourcing_worker
	 */
	public int getIs_crowdsourcing_worker() {
		return is_crowdsourcing_worker;
	}

	/**
	 * @param is_crowdsourcing_worker the is_crowdsourcing_worker to set
	 */
	public void setIs_crowdsourcing_worker(int is_crowdsourcing_worker) {
		this.is_crowdsourcing_worker = is_crowdsourcing_worker;
	}

	/**
	 * @return the is_reserved
	 */
	public int getIs_reserved() {
		return is_reserved;
	}

	/**
	 * @param is_reserved the is_reserved to set
	 */
	public void setIs_reserved(int is_reserved) {
		this.is_reserved = is_reserved;
	}

	/**
	 * @return the is_generally_trusting
	 */
	public int getIs_generally_trusting() {
		return is_generally_trusting;
	}

	/**
	 * @param is_generally_trusting the is_generally_trusting to set
	 */
	public void setIs_generally_trusting(int is_generally_trusting) {
		this.is_generally_trusting = is_generally_trusting;
	}

	/**
	 * @return the lazy
	 */
	public int getLazy() {
		return lazy;
	}

	/**
	 * @param lazy the lazy to set
	 */
	public void setLazy(int lazy) {
		this.lazy = lazy;
	}

	/**
	 * @return the relaxed
	 */
	public int getRelaxed() {
		return relaxed;
	}

	/**
	 * @param relaxed the relaxed to set
	 */
	public void setRelaxed(int relaxed) {
		this.relaxed = relaxed;
	}

	/**
	 * @return the artistic_interest
	 */
	public int getArtistic_interest() {
		return artistic_interest;
	}

	/**
	 * @param artistic_interest the artistic_interest to set
	 */
	public void setArtistic_interest(int artistic_interest) {
		this.artistic_interest = artistic_interest;
	}

	/**
	 * @return the sociable
	 */
	public int getSociable() {
		return sociable;
	}

	/**
	 * @param sociable the sociable to set
	 */
	public void setSociable(int sociable) {
		this.sociable = sociable;
	}

	/**
	 * @return the find_faults
	 */
	public int getFind_faults() {
		return find_faults;
	}

	/**
	 * @param find_faults the find_faults to set
	 */
	public void setFind_faults(int find_faults) {
		this.find_faults = find_faults;
	}

	/**
	 * @return the thorough_job
	 */
	public int getThorough_job() {
		return thorough_job;
	}

	/**
	 * @param thorough_job the thorough_job to set
	 */
	public void setThorough_job(int thorough_job) {
		this.thorough_job = thorough_job;
	}

	/**
	 * @return the nervous
	 */
	public int getNervous() {
		return nervous;
	}

	/**
	 * @param nervous the nervous to set
	 */
	public void setNervous(int nervous) {
		this.nervous = nervous;
	}

	/**
	 * @return the active_imagination
	 */
	public int getActive_imagination() {
		return active_imagination;
	}

	/**
	 * @param active_imagination the active_imagination to set
	 */
	public void setActive_imagination(int active_imagination) {
		this.active_imagination = active_imagination;
	}
}