package com.sim_choir.entity;


/**
 * 合唱团成员类
 * @author Charles
 *
 */
public class Member {

	private int id;
	private String name;
	private int grade;
	private int majorId;
	private String major;  //专业
	private String part;
	private int dutyId;
	private String duty;
	private byte[] photo;
	private int state;
	private int previewOrder;
	
	 
	public int getMajorId() {
		return majorId;
	}
	public void setMajorId(int majorId) {
		this.majorId = majorId;
	}
	public int getDutyId() {
		return dutyId;
	}
	public void setDutyId(int dutyId) {
		this.dutyId = dutyId;
	}
	public int getPreviewOrder() {
		return previewOrder;
	}
	public void setPreviewOrder(int previewOrder) {
		this.previewOrder = previewOrder;
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
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
	}
	public byte[] getPhoto() {
		return photo;
	}
	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", grade=" + grade + ", major=" + major + ", part=" + part
				+ ", duty=" + duty + ", state=" + state + "]";
	}
	
	
}
