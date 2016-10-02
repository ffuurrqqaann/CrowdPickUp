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
@Table(name="aw_word_relevancy_sentences")
//@Table(name="AW_WORD_RELEVANCY_SENTENCES")
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
	
	@Column(name="ground_truth")
	private int groundTruth;
	
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
	
	/**
	 * @return the groundTruth
	 */
	public int getGroundTruth() {
		return groundTruth;
	}
	/**
	 * @param groundTruth the groundTruth to set
	 */
	public void setGroundTruth(int groundTruth) {
		this.groundTruth = groundTruth;
	}
	
}