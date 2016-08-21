package com.comag10.crowdflower.model;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Entity;

@Entity
@Table(name="LOCATION_PLACE_DESCRIPTION_DELIVERABLES")
public class PlaceDescriptionDeliverable {

	@Id
    @Column(name="deliverable_id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int deliverable_id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fk_user_id", nullable = false)
	private User fk_user_id;
	
	@Column(name="crowdedness")
	private int crowdedness;
	
	@Column(name="weather")
	private int weather;
	
	@Column(name="noise")
	private int noise;
	
	@Column(name="localrestaurant")
	private String localrestaurant;
	
	@Column(name="trafficsituation")
	private int trafficsituation;
	
	@Column(name="availableservices")
	private int availableservices;
	
	@Column(name="locationeasytofind")
	private int locationeasytofind;
	
	@Column(name="time_taken")
	private long time_taken;
	
	@Column(name="created")
	private String created;
	
	@Column(name="updated")
	private String updated;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "location_id", nullable = false)
	private Location locationDeliverable;

	public int getDeliverable_id() {
		return deliverable_id;
	}
	public void setDeliverable_id(int deliverable_id) {
		this.deliverable_id = deliverable_id;
	}

	public User getFk_user_id() {
		return fk_user_id;
	}
	public void setFk_user_id(User fk_user_id) {
		this.fk_user_id = fk_user_id;
	}

	public int getCrowdedness() {
		return crowdedness;
	}
	public void setCrowdedness(int crowdedness) {
		this.crowdedness = crowdedness;
	}

	public int getWeather() {
		return weather;
	}
	public void setWeather(int weather) {
		this.weather = weather;
	}

	public int getNoise() {
		return noise;
	}
	public void setNoise(int noise) {
		this.noise = noise;
	}

	public String getLocalrestaurant() {
		return localrestaurant;
	}
	public void setLocalrestaurant(String localrestaurant) {
		this.localrestaurant = localrestaurant;
	}

	public int getTrafficsituation() {
		return trafficsituation;
	}
	public void setTrafficsituation(int trafficsituation) {
		this.trafficsituation = trafficsituation;
	}

	public int getAvailableservices() {
		return availableservices;
	}
	public void setAvailableservices(int availableservices) {
		this.availableservices = availableservices;
	}

	public int getLocationeasytofind() {
		return locationeasytofind;
	}
	public void setLocationeasytofind(int locationeasytofind) {
		this.locationeasytofind = locationeasytofind;
	}

	public long getTime_taken() {
		return time_taken;
	}
	public void setTime_taken(long time_taken) {
		this.time_taken = time_taken;
	}

	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}

	public String getUpdated() {
		return updated;
	}
	public void setUpdated(String updated) {
		this.updated = updated;
	}
	
	public Location getLocationDeliverable() {
		return locationDeliverable;
	}
	public void setLocationDeliverable(Location locationDeliverable) {
		this.locationDeliverable = locationDeliverable;
	}
	
}