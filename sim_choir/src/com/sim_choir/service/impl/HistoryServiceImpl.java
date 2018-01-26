package com.sim_choir.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sim_choir.dao.HistoryDao;
import com.sim_choir.entity.History;
import com.sim_choir.service.HistoryService;
@Service("HistoryService")
public class HistoryServiceImpl implements HistoryService {

	@Resource
	private HistoryDao historyDao;
	
	@Override
	public List<History> getPreview() {
		List<History> historyList = new ArrayList<History>();
		List<History> history = historyDao.findAll();
		//判断所有历史纪录是否超过四个
		if(history.size()>=4){
			for(int i = 0;i<4;i++){
				historyList.add(history.get(i));
			}
		}else{
			for(int i =0;i<history.size();i++){
				historyList.add(history.get(i));
			}
			for(int i =0;i<4-history.size();i++){
				History his = new History();
				his.setContent("没有更多发展历史了...");
				historyList.add(his);
			}
		}
		return historyList;
	}

	@Override
	public List<History> getAll() {
		return historyDao.findAll();
	}

	@Override
	public int add(History history) {
		return historyDao.add(history);
	}

	@Override
	public int delete(int id) {
		return historyDao.delete(id);
	}

}
