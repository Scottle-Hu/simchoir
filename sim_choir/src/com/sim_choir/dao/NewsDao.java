package com.sim_choir.dao;

import java.util.List;

import com.sim_choir.entity.News;

/**
 * 动态有关的dao
 * @author Charles
 *
 */
public interface NewsDao {

	//查询所有动态
	public List<News> findAll();
	
	//按照id查询
	public List<News> findById(int id);
	
	//添加动态
	public int addNews(News news);
	
	//删除动态
	public int delete(int id);
	
	//动态点赞加一
	public int updatePraiseNum(int id);
	
	//浏览加一
	public int updateScanNum(int id);
	
	//根据评论获取动态标题
	public String findTittleByRemark(int id);
	
}
