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
@Table(name="AW_IMAGE_IDENTIFICATION_DELIVERABLES")
public class ImageIdentificationDeliverable {

	@Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="suggested_name")
	private String suggested_name;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "resource_id", nullable = false)
	private ImageIdentification resource_id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fk_user_id", nullable = false)
	private User fk_user_id;
	
	@Column(name="time_taken")
	private long time_taken ;
	
	@Column(name="skipped")
	private int skipped ;
	
	@Column(name="created")
	private String created;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getSuggested_name() {
		return suggested_name;
	}
	public void setSuggested_name(String suggested_name) {
		this.suggested_name = suggested_name;
	}
	
	public User getFk_user_id() {
		return fk_user_id;
	}
	public void setFk_user_id(User fk_user_id) {
		this.fk_user_id = fk_user_id;
	}
	
	public long getTime_taken() {
		return time_taken;
	}
	public void setTime_taken(long time_taken) {
		this.time_taken = time_taken;
	}
	
	public ImageIdentification getResource_id() {
		return resource_id;
	}
	public void setResource_id(ImageIdentification resource_id) {
		this.resource_id = resource_id;
	}
	
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
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
}