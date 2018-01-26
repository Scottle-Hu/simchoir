package com.sim_choir.entity;

import java.sql.Date;


/**
 * 网站浏览统计信息类
 * @author Charles
 *
 */
public class Statistics {

	private int id;
	private String date;
	private int scanNum;
	
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
	public int getScanNum() {
		return scanNum;
	}
	public void setScanNum(int scanNum) {
		this.scanNum = scanNum;
	}
	@Override
	public String toString() {
		return "Statistics [id=" + id + ", date=" + date + ", scanNum=" + scanNum + "]";
	}
	@Override
	public boolean equals(Object obj) {
		return ((Statistics)obj).getId()==id;
	}
	
	
}
