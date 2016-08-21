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
@Table(name="AW_WORD_RELEVANCY_SENTENCES")
public class WordRelevancySentence {

	@Id
    @Column(name="sentence_id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int sentence_id;
	
	@Column(name="text")
	private String text;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "sentence")
	private Set<WordRelevancyWord> words;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "sentence")
	private Set<WordRelevancyDeliverable> sentenceDeliverable;
	
	@OneToOne(cascade = CascadeType.ALL)
	@PrimaryKeyJoinColumn
	private WordRelevancyWord groundTruth;
	
	public int getSentence_id() {
		return sentence_id;
	}
	public void setSentence_id(int sentence_id) {
		this.sentence_id = sentence_id;
	}

	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	public Set<WordRelevancyWord> getWords() {
		return words;
	}
	public void setWords(Set<WordRelevancyWord> words) {
		this.words = words;
	}
	
	public WordRelevancyWord getGroundTruth() {
		return groundTruth;
	}
	public void setGroundTruth(WordRelevancyWord groundTruth) {
		this.groundTruth = groundTruth;
	}
	
}