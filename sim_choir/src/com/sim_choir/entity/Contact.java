package com.sim_choir.entity;
/**
 * 联系方式
 * @author Charles
 *
 */
public class Contact {

	private byte[] weixin;
	private String room;
	private String tel1;
	private String tel2;
	private String tel3;
	private String email;
	public byte[] getWeixin() {
		return weixin;
	}
	public void setWeixin(byte[] weixin) {
		this.weixin = weixin;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
