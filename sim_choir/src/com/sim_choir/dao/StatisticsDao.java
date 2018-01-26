package com.sim_choir.dao;

import java.sql.Date;

import com.sim_choir.entity.Statistics;

/**
 * 浏览量数据处理
 * @author Charles
 *
 */
public interface StatisticsDao {

	//插入新的日期记录
	public int add(Statistics sta);
	
	//某日期浏览量加一
	public int updateDate(Date date);
	
	//获取两个时间之间的浏览量
	public int findPeriodNum(Date date1,Date date2);
	
	//获取总浏览量
	public int findAllNum();
	
	//删除辅助记录‘’
	public int deteleHelp();
	
}
