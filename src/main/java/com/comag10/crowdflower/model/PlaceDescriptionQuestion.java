package com.comag10.crowdflower.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Entity;

@Entity
@Table(name="LOCATION_PLACE_DESCRIPTION_QUESTIONS")
public class PlaceDescriptionQuestion {

	@Id
    @Column(name="question_id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int question_id;
	
	@Column(name="text")
	private String text;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "question")
	private Set<PlaceDescriptionDeliverable> question;

	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}

	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	public Set<PlaceDescriptionDeliverable> getQuestion() {
		return question;
	}
	public void setQuestion(Set<PlaceDescriptionDeliverable> question) {
		this.question = question;
	}
		
}