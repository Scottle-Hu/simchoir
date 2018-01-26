package com.sim_choir.service.impl;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sim_choir.dao.AlbumDao;
import com.sim_choir.entity.Album;
import com.sim_choir.service.AlbumService;
/**
 * AlbumService实现类
 * @author Charles
 *
 */
@Service("AlbumService")
public class AlbumServiceImpl implements AlbumService {

	@Resource
	private AlbumDao albumDao;
	
	@Override
	public List<Album> getAll() {
		//按照时间顺序
		List<Album> list = albumDao.findAll();
		List<Album> result = new ArrayList<Album>();
		for(int i = list.size()-2;i>=0;i--){
			result.add(list.get(i));
		}
		return result;
	}

	@Override
	public Album getById(int id) {
		List<Album> album = albumDao.findById(id);
		return album.size()>0?album.get(0):null;
	}

	@Override
	public Album getLatest() {
		List<Album> list = albumDao.findAll();
		return list.size()>0?list.get(list.size()-1):new Album("暂无相册",(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")).format(new Date(System.currentTimeMillis())),"还没有新的相册哦...");
	}

	@Override
	public int addAlbum(Album album) {
		return albumDao.add(album);
	}

	@Override
	public int deleteAlbum(int id) {
		return albumDao.deleteAlbum(id);
	}

	@Override
	public int updateAlbumName(Album album) {
		return albumDao.updateAlbumName(album);
	}

	@Override
	public int updateAlbumDesc(Album album) {
		return albumDao.updateAlbumDesc(album);
	}

}
