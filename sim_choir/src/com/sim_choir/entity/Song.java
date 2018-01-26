package com.sim_choir.entity;

import java.util.List;



/**
 * 我们的歌曲类
 * @author Charles
 *
 */
public class Song {

	private int id;
	private int isVideo;
	private int isLink;
	private String name;
	private String introduction;
	private byte[] content;
	private int state;
	private int scanNum;
	private int praiseNum;
	private List<Remark> remarkList;
	
	
	
	
	public int getIsVideo() {
		return isVideo;
	}
	public void setIsVideo(int isVideo) {
		this.isVideo = isVideo;
	}
	public int getIsLink() {
		return isLink;
	}
	public void setIsLink(int isLink) {
		this.isLink = isLink;
	}
	public List<Remark> getRemarkList() {
		return remarkList;
	}
	public void setRemarkList(List<Remark> remarkList) {
		this.remarkList = remarkList;
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
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public byte[] getContent() {
		return content;
	}
	public void setContent(byte[] content) {
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
		return "Song [id=" + id + ", isVideo=" + isVideo + ", isLink=" + isLink + ", name=" + name + ", introduction="
				+ introduction + ", state=" + state + "]";
	}
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return ((Song)obj).getId()==id;
	}
	
}
