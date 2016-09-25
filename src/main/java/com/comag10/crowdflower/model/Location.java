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

@Entity
@Table(name="LOCATIONS")
public class Location {

	@Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="address")
	private String address;
	
	@Column(name="description")
	private String description;
	
	@Column(name="image")
	private String image;
	
	@Column(name="latitude")
	private double latitude;
	
	@Column(name="longitude")
	private double longitude;
	
	@Column(name="postal_code")
	private String postal_code;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "locationDeliverable")
	private Set<PlaceDescriptionDeliverable> placeDescriptionDeliverable;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	
	public Set<PlaceDescriptionDeliverable> getPlaceDescriptionDeliverable() {
		return placeDescriptionDeliverable;
	}
	public void setPlaceDescriptionDeliverable(
			Set<PlaceDescriptionDeliverable> placeDescriptionDeliverable) {
		this.placeDescriptionDeliverable = placeDescriptionDeliverable;
	}
	/**
	 * @return the postal_code
	 */
	public String getPostal_code() {
		return postal_code;
	}
	/**
	 * @param postal_code the postal_code to set
	 */
	public void setPostal_code(String postal_code) {
		this.postal_code = postal_code;
	}
	
}