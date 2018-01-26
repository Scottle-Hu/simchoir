package com.sim_choir.dao;

import java.util.List;

import com.sim_choir.entity.History;
import com.sim_choir.entity.Introduction;

/**
 * 发展历史有关的dao
 * @author Charles
 *
 */
public interface HistoryDao {

	//获取所有
	public List<History> findAll();
	//按id获取
	public History findById(int id);
	//添加
	public int add(History history);
	//删除记录
	public int delete(int id);
}
