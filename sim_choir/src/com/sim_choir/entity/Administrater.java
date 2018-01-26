package com.sim_choir.entity;
/**
 * 管理员类
 * @author Charles
 *
 */
public class Administrater {

	private int id;
	private String username;
	private String password;
	private int state;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Administrater [id=" + id + ", username=" + username + ", password=" + password + ", state=" + state
				+ "]";
	}
	
	
}
