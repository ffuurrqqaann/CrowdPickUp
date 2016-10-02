package com.comag10.crowdflower.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Entity;

@Entity
@Table(name="aw_word_relevancy_words")
//@Table(name="AW_WORD_RELEVANCY_WORDS")
public class WordRelevancyWord {

	@Id
    @Column(name="word_id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int word_id;
	
	@Column(name="text")
	private String text;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fk_sentence_id", nullable = false)
	private WordRelevancySentence sentence;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "word")
	private Set<WordRelevancyDeliverable> wordDeliverable;
	
	public int getWord_id() {
		return word_id;
	}
	public void setWord_id(int word_id) {
		this.word_id = word_id;
	}

	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	public WordRelevancySentence getSentence() {
		return sentence;
	}
	public void setSentence(WordRelevancySentence sentence) {
		this.sentence = sentence;
	}
	
	public Set<WordRelevancyDeliverable> getWordDeliverable() {
		return wordDeliverable;
	}
	public void setWordDeliverable(Set<WordRelevancyDeliverable> wordDeliverable) {
		this.wordDeliverable = wordDeliverable;
	}
	
}