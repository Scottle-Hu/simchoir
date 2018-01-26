package com.sim_choir.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sim_choir.dao.NewsDao;
import com.sim_choir.entity.News;
import com.sim_choir.entity.Remark;
import com.sim_choir.service.NewsService;
/**
 * NewsService的实现
 * @author Charles
 *
 */
@Service("NewsService")
public class NewsServiceImpl implements NewsService {

	@Resource
	private NewsDao newsDao;
	
	//获取首页显示的2条动态
	@Override
	public List<News> getPreview() {
		List<News> previewList = new ArrayList<News>();
		List<News> newsList = newsDao.findAll();
		//判断记录的个数
		if(newsList.size()>=2){
			for(int i = 0;i<2;i++){
				previewList.add(newsList.get(newsList.size()-i-1));
			}
		}else{
			for(int i = 0;i<newsList.size();i++){
				previewList.add(newsList.get(newsList.size()-i-1));
			}
			for(int i = 0;i<2-newsList.size();i++){
				News news = new News();
				news.setTittle("暂无动态");
				news.setContent("没有更多动态了...");
				news.setPic(null);
				previewList.add(news);
			}
		}
		return previewList;
	}

	@Override
	public News getById(int id) {
		News news = newsDao.findById(id).get(0);
		List<Remark> remarkList = new ArrayList<Remark>();
		List<Remark> remarks = news.getRemarkList();
		//System.out.println(remarks);
		if(remarks!=null){
			for(int i=0;i<remarks.size();i++){
				remarkList.add(remarks.get(remarks.size()-i-1));
			}
			news.setRemarkList(remarkList);
		}
		return news;
	}

	@Override
	public List<News> getAll() {
		List<News> news = new ArrayList<News>();
		List<News> newsList = newsDao.findAll();
		for(int i = newsList.size()-1;i>=0;i--){
			news.add(newsList.get(i));
		}
		return news;
	}

	@Override
	public int delete(int id) {
		return newsDao.delete(id);
	}

	@Override
	public int add(News news) {
		return newsDao.addNews(news);
	}

	@Override
	public int updatePraiseNum(int id) {
		return newsDao.updatePraiseNum(id);
	}

	@Override
	public int updateScanNum(int id) {
		return newsDao.updateScanNum(id);
	}

}
