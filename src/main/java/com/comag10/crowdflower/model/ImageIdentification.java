package com.comag10.crowdflower.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Entity;

@Entity
@Table(name="aw_image_identification_resources")
//@Table(name="AW_IMAGE_IDENTIFICATION_RESOURCES")
public class ImageIdentification {

	@Id
    @Column(name="resource_id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int resource_id;
	
	@Column(name="image_url")
	private String image_url;
	
	@Column(name="ground_truth")
	private String ground_truth;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "resource_id")
	private Set<ImageIdentificationDeliverable> imageIdentificationDeliverable;
	
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	
	public String getGround_truth() {
		return ground_truth;
	}
	public void setGround_truth(String ground_truth) {
		this.ground_truth = ground_truth;
	}
	
	public int getResource_id() {
		return resource_id;
	}
	public void setResource_id(int resource_id) {
		this.resource_id = resource_id;
	}
	
	public Set<ImageIdentificationDeliverable> getImageIdentificationDeliverable() {
		return imageIdentificationDeliverable;
	}
	public void setImageIdentificationDeliverable(
			Set<ImageIdentificationDeliverable> imageIdentificationDeliverable) {
		this.imageIdentificationDeliverable = imageIdentificationDeliverable;
	}
}