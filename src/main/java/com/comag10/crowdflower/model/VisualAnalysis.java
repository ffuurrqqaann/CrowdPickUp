package com.comag10.crowdflower.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="aw_visual_resources")
//@Table(name="AW_VISUAL_RESOURCES")
public class VisualAnalysis {

	@Id
    @Column(name="resource_id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int resource_id;
	
	@Column(name="image_path")
	private String image_path;
	
	@Column(name="ground_truth")
	private String ground_truth;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "resource_id")
	private Set<VisualAnalysisDeliverable> visualAnalysisDeliverable;
	
	public String getImage_path() {
		return image_path;
	}
	public void setImage_url(String image_path) {
		this.image_path = image_path;
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
	
	public Set<VisualAnalysisDeliverable> getVisualAnalysisDeliverable() {
		return visualAnalysisDeliverable;
	}
	public void setVisualAnalysisDeliverable(
			Set<VisualAnalysisDeliverable> visualAnalysisDeliverable) {
		this.visualAnalysisDeliverable = visualAnalysisDeliverable;
	}
}