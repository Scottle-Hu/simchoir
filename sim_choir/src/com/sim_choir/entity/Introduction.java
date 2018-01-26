package com.sim_choir.entity;

import java.util.Date;

/**
 * 合唱团简介类
 * @author Charles
 *
 */
public class Introduction {

	private int id;
	private String introdution;
	private String presentation; //html内容
	private int state;
	
	
	public String getPresentation() {
		return presentation;
	}
	public void setPresentation(String presentation) {
		this.presentation = presentation;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIntrodution() {
		return introdution;
	}
	public void setIntrodution(String introdution) {
		this.introdution = introdution;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Introduction [introdution=" + introdution + ", state=" + state + "]";
	}
	
	
	
}
