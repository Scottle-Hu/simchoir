package com.sim_choir.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sim_choir.dao.AdminDao;
import com.sim_choir.entity.Administrater;
import com.sim_choir.service.AdminService;
/**
 * AdminService实现
 * @author Charles
 *
 */
@Service("AdminService")
public class AdminServiceImpl implements AdminService{

	@Resource
	private AdminDao adminDao;
	
	@Override
	public Administrater getById(int id) {
		// TODO Auto-generated method stub
		return adminDao.findById(id);
	}

	@Override
	public List<Administrater> getByName(String username) {
		// TODO Auto-generated method stub
		return adminDao.findByName(username);
	}

}
