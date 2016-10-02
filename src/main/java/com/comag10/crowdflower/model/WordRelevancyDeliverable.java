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
@Table(name="aw_word_relevancy_deliverables")
//@Table(name="AW_WORD_RELEVANCY_DELIVERABLES")
public class WordRelevancyDeliverable {

	@Id
    @Column(name="deliverable_id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int deliverable_id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fk_user_id", nullable = false)
	private User fk_user_id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fk_sentence_id", nullable = false)
	private WordRelevancySentence sentence;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fk_word_id", nullable = false)
	private WordRelevancyWord word;
	
	@Column(name="time_taken")
	private long time_taken ;
	
	@Column(name="skipped")
	private int skipped ;
	
	@Column(name="is_correct")
	private int isCorrect ;

	@Column(name="created")
	private String created ;

	public int getDeliverable_id() {
		return deliverable_id;
	}
	public void setDeliverable_id(int deliverable_id) {
		this.deliverable_id = deliverable_id;
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
	
	public WordRelevancySentence getSentence() {
		return sentence;
	}
	public void setSentence(WordRelevancySentence sentence) {
		this.sentence = sentence;
	}
	
	public WordRelevancyWord getWord() {
		return word;
	}
	public void setWord(WordRelevancyWord word) {
		this.word = word;
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
	
	/**
	 * @return the isCorrect
	 */
	public int getIsCorrect() {
		return isCorrect;
	}
	/**
	 * @param isCorrect the isCorrect to set
	 */
	public void setIsCorrect(int isCorrect) {
		this.isCorrect = isCorrect;
	}
}