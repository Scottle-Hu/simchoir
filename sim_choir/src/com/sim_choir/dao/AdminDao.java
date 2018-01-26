package com.sim_choir.dao;

import java.util.List;

import com.sim_choir.entity.Administrater;

/**
 * 管理员类有关dao
 * @author Charles
 *
 */
public interface AdminDao {

	//通过id查找管理员
	public Administrater findById(int id);
	
	//通过用户名查找
	public List<Administrater> findByName(String username);
}
