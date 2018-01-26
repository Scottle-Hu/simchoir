package com.sim_choir.service;

import java.util.List;

import com.sim_choir.entity.History;

/**
 * History
 * @author Charles
 *
 */
public interface HistoryService {

	//获取预览的集合
	public List<History> getPreview();
	//获取所有
	public List<History> getAll();
	//添加
	public int add(History history);
	//删除记录
	public int delete(int id);
}
