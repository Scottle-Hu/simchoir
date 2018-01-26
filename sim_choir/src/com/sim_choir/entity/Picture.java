package com.sim_choir.entity;

import java.util.Date;

/**
 * 图片类
 * @author Charles
 *
 */
public class Picture {

	private int id;
	private byte[] pic;
	private String tittle;
	private String date;
	private int state;
	private int albumId;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public byte[] getPic() {
		return pic;
	}
	public void setPic(byte[] pic) {
		this.pic = pic;
	}
	public String getTittle() {
		return tittle;
	}
	public void setTittle(String tittle) {
		this.tittle = tittle;
	}
	
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
	public int getAlbumId() {
		return albumId;
	}
	public void setAlbumId(int albumId) {
		this.albumId = albumId;
	}
	@Override
	public String toString() {
		return "Picture [id=" + id + ", tittle=" + tittle + ", date=" + date
				+ ", state=" + state + ", albumId=" + albumId + "]";
	}
	
}
