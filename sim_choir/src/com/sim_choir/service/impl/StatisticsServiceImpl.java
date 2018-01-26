package com.sim_choir.service.impl;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sim_choir.dao.StatisticsDao;
import com.sim_choir.entity.Statistics;
import com.sim_choir.service.StatisticsService;

/**
 * StatisticsService实现
 * @author Charles
 *
 */
@Service("StatisticsService")
public class StatisticsServiceImpl implements StatisticsService {

	@Resource 
	private StatisticsDao statisticsDao;

	@Override
	public int add() {
		java.util.Date date = new java.util.Date();
		if(findToday()==0){
			Statistics s = new Statistics();
			s.setScanNum(1);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			s.setDate(df.format(new Date(date.getTime()-date.getHours()*3600*1000-date.getMinutes()*60*1000-date.getSeconds()*1000)));
			statisticsDao.add(s);
		}else{
			statisticsDao.updateDate(new Date(date.getTime()-date.getHours()*3600*1000-date.getMinutes()*60*1000-date.getSeconds()*1000));
		}
		return 1;
	}

	@Override
	public int findAllNum() {
		return statisticsDao.findAllNum();
	}

	@Override
	public int findToday() {
		//辅助记录，防止出现null错误
		Date helpDate = new Date(System.currentTimeMillis()-10);
		Statistics s = new Statistics();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		s.setDate(df.format(helpDate));
		s.setScanNum(0);
		statisticsDao.add(s);
		
		java.util.Date date = new java.util.Date();
		Date date1 = new Date(date.getTime()-date.getHours()*3600*1000-10); //昨天的某个时刻
		Date date2 = new Date(date.getTime());
		int result = statisticsDao.findPeriodNum(date1, date2);
		//删除辅助记录
		statisticsDao.deteleHelp();
				
		return result;
	}

	@Override
	public int findWeek() {
		//辅助记录，防止出现null错误
		Date helpDate = new Date(System.currentTimeMillis()-10);
		Statistics s = new Statistics();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		s.setDate(df.format(helpDate));
		s.setScanNum(0);
		statisticsDao.add(s);
		
		java.util.Date date = new java.util.Date();
		//一周前的某个时刻
		Date date1 = new Date(date.getTime()-7*24*3600*1000-date.getHours()*3600*1000-10); //昨天的某个时刻
		Date date2 = new Date(date.getTime());
		
		int result = statisticsDao.findPeriodNum(date1, date2);
		//删除辅助记录
		statisticsDao.deteleHelp();
				
		return result;
	}

	@Override
	public int findMonth() {
		//辅助记录，防止出现null错误
		Date helpDate = new Date(System.currentTimeMillis()-10);
		Statistics s = new Statistics();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		s.setDate(df.format(helpDate));
		s.setScanNum(0);
		statisticsDao.add(s);
		
		java.util.Date date = new java.util.Date();
		//一个月前的某个时刻
		Date date1 = new Date(date.getTime()-20*24*3600*1000-date.getHours()*3600*1000-10); //昨天的某个时刻
		Date date2 = new Date(date.getTime());
		
		int result = statisticsDao.findPeriodNum(date1, date2);
		//删除辅助记录
		statisticsDao.deteleHelp();
				
		return result;
	}

	
}
