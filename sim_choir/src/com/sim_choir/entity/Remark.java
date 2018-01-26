package com.sim_choir.entity;

import java.util.Date;

/**
 * 评论类（歌曲、动态）
 */
public class Remark {

	private int id;
	private int isNews;  //判断是否为动态评论，true为动态,false为歌曲
	private int itemId;  //对应的动态或者歌曲的id
	private String ip; //评论者ip
	private String content;
	private String date;
	private String songName;
	private String newsTittle;
	
	
	
	public String getSongName() {
		return songName;
	}
	public void setSongName(String songName) {
		this.songName = songName;
	}
	public String getNewsTittle() {
		return newsTittle;
	}
	public void setNewsTittle(String newsTittle) {
		this.newsTittle = newsTittle;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getIsNews() {
		return isNews;
	}
	public void setIsNews(int isNews) {
		this.isNews = isNews;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Remark [id=" + id + ", isNews=" + isNews + ", itemId=" + itemId + ", ip=" + ip + ", content=" + content
				+ ", date=" + date + ", songName=" + songName + ", newsTittle=" + newsTittle + "]";
	}
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return ((Remark)obj).getId()==id;
	}
	
	
	
}
