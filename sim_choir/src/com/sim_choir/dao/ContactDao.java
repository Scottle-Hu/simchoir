package com.sim_choir.dao;

import com.sim_choir.entity.Contact;

/**
 * 联系方式dao
 * @author Charles
 *
 */
public interface ContactDao {

	//获取所有联系方式
	public Contact find();
	
	//修改联系方式
	public int update(Contact contact);
	
	//顺带加上指挥特辑的dao
	//获取指挥特辑的内容
	public String findPreOfConductor();
	
	//修改指挥特辑的内容
	public int updatePreOfConductor(String pre);
}
