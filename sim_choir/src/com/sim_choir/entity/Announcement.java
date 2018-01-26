package com.sim_choir.entity;

import java.util.Date;

/**
 * 公告通知类
 * @author Charles
 *
 */
public class Announcement {

	private int id;
	private String date;
	private String tittle;
	private String content;
	private Administrater admin;
	private int state;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTittle() {
		return tittle;
	}
	public void setTittle(String tittle) {
		this.tittle = tittle;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Administrater getAdmin() {
		return admin;
	}
	public void setAdmin(Administrater admin) {
		this.admin = admin;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Announcement [id=" + id + ", date=" + date + ", tittle=" + tittle + ", content=" + content + ", admin="
				+ admin + ", state=" + state + "]";
	}
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return ((Announcement)obj).getId()==this.id;
	}
	
}
