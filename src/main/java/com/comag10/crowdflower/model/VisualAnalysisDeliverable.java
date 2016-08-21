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
@Table(name="AW_VISUAL_DELIVERABLES")
public class VisualAnalysisDeliverable {

	@Id
    @Column(name="deliverable_id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int deliverable_id;
	
	@Column(name="answer")
	private String answer;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "resource_id", nullable = false)
	private VisualAnalysis resource_id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fk_user_id", nullable = false)
	private User fk_user_id;
	
	@Column(name="time_taken")
	private long time_taken ;
	
	@Column(name="skipped")
	private long skipped ;
	
	@Column(name="created")
	private String created ;
	
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
	
	public int getDeliverable_id() {
		return deliverable_id;
	}
	public void setDeliverable_id(int deliverable_id) {
		this.deliverable_id = deliverable_id;
	}
	
	public VisualAnalysis getResource_id() {
		return resource_id;
	}
	public void setResource_id(VisualAnalysis resource_id) {
		this.resource_id = resource_id;
	}
	
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
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
	public long getSkipped() {
		return skipped;
	}
	/**
	 * @param skipped the skipped to set
	 */
	public void setSkipped(long skipped) {
		this.skipped = skipped;
	}
}