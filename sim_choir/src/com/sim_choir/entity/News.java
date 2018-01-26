package com.sim_choir.entity;

import java.util.Date;
import java.util.List;

/**
 * 动态类
 * @author Charles
 *
 */
public class News {

	private int id;
	private String date;
	private String tittle;
	private String content;
	private String presentation; //html内容，用于显示
	private byte[] pic;  //封面图片
	private Administrater admin;
	private int state;
	private int praiseNum;
	private int scanNum;
	private List<Remark> remarkList;
	
	
	
	public String getPresentation() {
		return presentation;
	}
	public void setPresentation(String presentation) {
		this.presentation = presentation;
	}
	public int getScanNum() {
		return scanNum;
	}
	public void setScanNum(int scanNum) {
		this.scanNum = scanNum;
	}
	public int getPraiseNum() {
		return praiseNum;
	}
	public void setPraiseNum(int praiseNum) {
		this.praiseNum = praiseNum;
	}
	public List<Remark> getRemarkList() {
		return remarkList;
	}
	public void setRemarkList(List<Remark> remarkList) {
		this.remarkList = remarkList;
	}
	public byte[] getPic() {
		return pic;
	}
	public void setPic(byte[] pic) {
		this.pic = pic;
	}
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
		return "News [id=" + id + ", date=" + date + ", tittle=" + tittle + ", content=" + content + ", admin="
				+ admin + ", state=" + state + "]";
	}
	@Override
	public boolean equals(Object obj) {
		return ((News)obj).id==id;
	}
	
}
