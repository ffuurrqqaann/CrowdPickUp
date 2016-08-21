package com.comag10.crowdflower.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Entity;

@Entity
@Table(name="STUDENT_HOUSING_DELIVERABLE")
public class StudentHousingDeliverable {

	@Id
    @Column(name="deliverable_id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int deliverable_id;
	
	//@ManyToOne(fetch = FetchType.LAZY)
	@Column(name = "fk_user_id")//, nullable = false)
	private int fk_user_id;
	
	@Column(name="fk_housing_location_id")
	private int fk_housing_location_id;
	
	@Column(name="cleanliness")
	private int cleanliness;
	
	@Column(name="nearby_services")
	private int nearby_services;
	
	@Column(name="location")
	private int location;
	
	@Column(name="cost")
	private int cost;
	
	@Column(name="internet")
	private int internet;

	@Column(name="maintenance")
	private int maintenance;
	
	@Column(name="is_skipped")
	private int is_skipped;
	
	@Column(name="time_taken")
	private long time_taken;
	
	@Column(name="created")
	private String created;

	/**
	 * @return the deliverable_id
	 */
	public int getDeliverable_id() {
		return deliverable_id;
	}

	/**
	 * @param deliverable_id the deliverable_id to set
	 */
	public void setDeliverable_id(int deliverable_id) {
		this.deliverable_id = deliverable_id;
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
	 * @return the fk_housing_location_id
	 */
	public int getFk_housing_location_id() {
		return fk_housing_location_id;
	}

	/**
	 * @param fk_housing_location_id the fk_housing_location_id to set
	 */
	public void setFk_housing_location_id(int fk_housing_location_id) {
		this.fk_housing_location_id = fk_housing_location_id;
	}

	/**
	 * @return the cleanliness
	 */
	public int getCleanliness() {
		return cleanliness;
	}

	/**
	 * @param cleanliness the cleanliness to set
	 */
	public void setCleanliness(int cleanliness) {
		this.cleanliness = cleanliness;
	}

	/**
	 * @return the nearby_services
	 */
	public int getNearby_services() {
		return nearby_services;
	}

	/**
	 * @param nearby_services the nearby_services to set
	 */
	public void setNearby_services(int nearby_services) {
		this.nearby_services = nearby_services;
	}

	/**
	 * @return the location
	 */
	public int getLocation() {
		return location;
	}

	/**
	 * @param location the location to set
	 */
	public void setLocation(int location) {
		this.location = location;
	}

	/**
	 * @return the cost
	 */
	public int getCost() {
		return cost;
	}

	/**
	 * @param cost the cost to set
	 */
	public void setCost(int cost) {
		this.cost = cost;
	}

	/**
	 * @return the internet
	 */
	public int getInternet() {
		return internet;
	}

	/**
	 * @param internet the internet to set
	 */
	public void setInternet(int internet) {
		this.internet = internet;
	}

	/**
	 * @return the maintenance
	 */
	public int getMaintenance() {
		return maintenance;
	}

	/**
	 * @param maintenance the maintenance to set
	 */
	public void setMaintenance(int maintenance) {
		this.maintenance = maintenance;
	}

	/**
	 * @return the is_skipped
	 */
	public int getIs_skipped() {
		return is_skipped;
	}

	/**
	 * @param is_skipped the is_skipped to set
	 */
	public void setIs_skipped(int is_skipped) {
		this.is_skipped = is_skipped;
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