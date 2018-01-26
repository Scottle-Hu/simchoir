package com.sim_choir.entity;

import java.sql.Date;
import java.util.List;

/**
 * 相册类
 * @author Charles
 *
 */
public class Album {

	private int id;
	private String name;
	private String date;
	private String description;
	private List<Picture> pics; //图片集合
	private int state;
	private int count;
	
	
	public Album() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Album(String string, String date2, String string2) {
		name=string;
		date = date2;
		description=string2;
	}
	
	public List<Picture> getPics() {
		return pics;
	}

	public void setPics(List<Picture> pics) {
		this.pics = pics;
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
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "Album [id=" + id + ", name=" + name + ", date=" + date + ", description=" + description + ", state="
				+ state + ", count=" + count + "]";
	}

	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return ((Album)obj).getId()==id;
	}
	
	
	
}
