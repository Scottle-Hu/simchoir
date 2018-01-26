package com.sim_choir.dao;

import java.util.List;

import com.sim_choir.entity.Announcement;

/**
 * 公告有关dao
 * @author Charles
 *
 */
public interface AnnouncementDao {

	//获取所有公告
	public List<Announcement> findAll();
	
	//按id获取公告
	public List<Announcement> findById(int id);
	
	//添加公告
	public int add(Announcement announcement);
	
	//按照id删除公告
	public int delete(int id);
	
	//修改公告名称
	public int updateTittle(Announcement anno);
	
	//修改公告内容
	public int updateContent(Announcement anno);
}
