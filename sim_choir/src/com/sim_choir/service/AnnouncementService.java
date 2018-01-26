package com.sim_choir.service;

import java.util.List;

import com.sim_choir.entity.Announcement;

/**
 * 公告有关的service接口
 * @author Charles
 *
 */
public interface AnnouncementService {

	//获取首页预览的3个最近公告
	public List<Announcement> getPreview();
	
	//获取所有公告
	public List<Announcement> getAll();
	
	//按id获取公告
	public Announcement getById(int id);
	
	//删除
	public int delete(int id);
	
	//修改公告名称
	public int updateTittle(Announcement anno);
	
	//修改公告内容
	public int updateContent(Announcement anno);
	
	//添加公告
	public int add(Announcement anno);
	
}
