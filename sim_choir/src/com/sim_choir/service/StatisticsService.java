package com.sim_choir.service;

import java.sql.Date;

import javax.annotation.Resource;

import com.sim_choir.dao.StatisticsDao;
import com.sim_choir.entity.Statistics;

/**
 * StatisticsService
 * @author Charles
 *
 */
public interface StatisticsService {

	//插入新的浏览记录
	public int add();
	
	
	//获取总浏览量
	public int findAllNum();
	
	//获取本日浏览量
	public int findToday();
	
	//获取本周浏览量
	public int findWeek();
	
	//获取本月浏览量
	public int findMonth();
	
}
