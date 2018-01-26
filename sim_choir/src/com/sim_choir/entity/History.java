package com.sim_choir.entity;

import java.util.Date;

/**
 * 历史事件类
 * @author Charles
 *
 */
public class History {

	private int id;
	private String sdate;
	private String edate;
	private String content;
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
	
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "History [id=" + id + ", sdate=" + sdate + ", edate=" + edate + ", content=" + content + ", state="
				+ state + "]";
	}
	
	
}
