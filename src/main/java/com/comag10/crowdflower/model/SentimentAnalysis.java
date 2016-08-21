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
@Table(name="AW_SENTIMENT_RESOURCES")
public class SentimentAnalysis {

	@Id
    @Column(name="resource_id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int resource_id;
	
	@Column(name="sentence")
	private String sentence;
	
	@Column(name="ground_truth")
	private String ground_truth;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "resource_id")
	private Set<SentimentAnalysisDeliverable> sentimentAnalysisDeliverable;
	
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
	
	public Set<SentimentAnalysisDeliverable> getSentimentAnalysisDeliverable() {
		return sentimentAnalysisDeliverable;
	}
	public void setSentimentAnalysisDeliverable(
			Set<SentimentAnalysisDeliverable> sentimentAnalysisDeliverable) {
		this.sentimentAnalysisDeliverable = sentimentAnalysisDeliverable;
	}
	
	public String getSentence() {
		return sentence;
	}
	public void setSentence(String sentence) {
		this.sentence = sentence;
	}
}