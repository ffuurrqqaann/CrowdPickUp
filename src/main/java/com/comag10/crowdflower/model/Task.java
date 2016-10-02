package com.comag10.crowdflower.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Entity;

@Entity
@Table(name="tasks")
//@Table(name="TASKS")
public class Task {

	@Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="task_name")
	private String task_name;
	
	@Column(name="task_description")
	private String task_description;
	
	@Column(name="fk_task_category_id")
	private int fk_task_category_id;
	
	@Column(name="screen_name")
	private String screen_name;
	
	@Column(name="def_reward")
	private int def_reward;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getTask_name() {
		return task_name;
	}
	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}
	
	public String getTask_description() {
		return task_description;
	}
	public void setTask_description(String task_description) {
		this.task_description = task_description;
	}
	
	public int getFk_task_category_id() {
		return fk_task_category_id;
	}
	public void setFk_task_category_id(int fk_task_category_id) {
		this.fk_task_category_id = fk_task_category_id;
	}
	
	public String getScreen_name() {
		return screen_name;
	}
	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name;
	}
	
	public int getDef_reward() {
		return def_reward;
	}
	public void setDef_reward(int def_reward) {
		this.def_reward = def_reward;
	}	
}