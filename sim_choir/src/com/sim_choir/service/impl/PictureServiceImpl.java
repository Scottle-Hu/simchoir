package com.sim_choir.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sim_choir.dao.PictureDao;
import com.sim_choir.entity.Picture;
import com.sim_choir.service.PictureService;
@Service("PictureService")
public class PictureServiceImpl implements PictureService{

	@Resource
	private PictureDao pictureDao;
	
	@Override
	public List<Picture> getAll() {
		return pictureDao.findAll();
	}

	@Override
	public List<Picture> getByAlbum(int albumId) {
		return pictureDao.findByAlbum(albumId);
	}

	@Override
	public Picture getById(int id) {
		return pictureDao.findById(id);
	}

	@Override
	public int addPic(Picture pic) {
		return pictureDao.add(pic);
	}

	@Override
	public int delete(int id) {
		return pictureDao.delete(id);
	}

}
