package com.sim_choir.service;

import java.util.List;

import com.sim_choir.entity.News;

/**
 * 动态有关service
 * @author Charles
 *
 */
public interface NewsService {

	//获得首页的两个动态列表
	public List<News> getPreview();
	
	//按照id获取动态
	public News getById(int id);

	public List<News> getAll();
	
	//删除动态
	public int delete(int id);
	
	//添加新闻
	public int add(News news);
	
	//动态点赞加一
	public int updatePraiseNum(int id);
	//动态浏览加一
	public int updateScanNum(int id);
	
	
}
