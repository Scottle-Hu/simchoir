package com.sim_choir.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sim_choir.dao.AnnouncementDao;
import com.sim_choir.entity.Announcement;
import com.sim_choir.service.AnnouncementService;
/**
 * AnnouncementService实现
 * @author Charles
 *
 */
@Service("AnnouncementService")
public class AnnouncementServiceImpl implements AnnouncementService {

	@Resource
	private AnnouncementDao announcementDao;
	
	@Override
	public List<Announcement> getPreview() {
		List<Announcement> previewAnno = new ArrayList<Announcement>();
		List<Announcement> annoList = announcementDao.findAll();
		//判断公告数目
		if(annoList.size()>=3){
			for(int i = 0;i<3;i++){
				previewAnno.add(annoList.get(annoList.size()-i-1));
			}
		}else{
			for(int i = 0;i<annoList.size();i++){
				previewAnno.add(annoList.get(annoList.size()-i-1));
			}
			for(int i = 0;i<3-annoList.size();i++){
				Announcement anno = new Announcement();
				anno.setDate(null);
				anno.setTittle("暂无公告");
				anno.setContent("暂时没有更多公告了...");
				previewAnno.add(anno);
			}
		}
		return previewAnno;
	}

	@Override
	public List<Announcement> getAll() {
		List<Announcement> annoAll = new ArrayList<Announcement>();
		List<Announcement> annoList = announcementDao.findAll();
		for(int i = annoList.size()-1;i>=0;i--){
			annoAll.add(annoList.get(i));
		}
		return annoAll;
	}

	@Override
	public Announcement getById(int id) {
		return announcementDao.findById(id).get(0);
	}

	@Override
	public int delete(int id) {
		return announcementDao.delete(id);
	}

	@Override
	public int updateTittle(Announcement anno) {
		return announcementDao.updateTittle(anno);
	}

	@Override
	public int updateContent(Announcement anno) {
		return announcementDao.updateContent(anno);
	}

	@Override
	public int add(Announcement anno) {
		return announcementDao.add(anno);
	}

}
