package com.sim_choir.service;

import java.util.List;

import com.sim_choir.entity.Administrater;

/**
 * 管理员账户有关
 * @author Charles
 *
 */
public interface AdminService {

	//获取特定id的记录
	public Administrater getById(int id);
	
	//按照用户名查询
	public List<Administrater> getByName(String username);
	
}
