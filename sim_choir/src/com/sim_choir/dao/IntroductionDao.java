package com.sim_choir.dao;

import java.util.List;

import com.sim_choir.entity.Introduction;

/**
 * Introduction简介有关的dao
 * @author Charles
 *
 */
public interface IntroductionDao {

	//获取简介
	public Introduction find();
	//修改简介
	public void setIntroduction(Introduction introduction);
	//添加记录
	public int add(Introduction introduction);
}
