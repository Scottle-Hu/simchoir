package com.sim_choir.entity;

import java.sql.Date;

/**
 * 用户信息
 * @author Charles
 *
 */

public class Message {
	private int id;
	private String name;
	private String email;
	private String phone;
	private String message;
	private int state;
	private String date;
	
	
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "Message [id=" + id + ", name=" + name + ", email=" + email + ", phone=" + phone + ", message="
				+ message + "]";
	}
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return ((Message)obj).getId()==id;
	}
	
	
}
