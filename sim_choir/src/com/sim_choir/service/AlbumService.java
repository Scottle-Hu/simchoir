package com.sim_choir.service;

import java.util.List;

import com.sim_choir.entity.Album;

/**
 * 相册有关的service
 * @author Charles
 *
 */
public interface AlbumService {

	//获取所有相册
	public List<Album> getAll();
	//按照id获取相册
	public Album getById(int id);
	//获取最新相册
	public Album getLatest();
	//添加相册
	public int addAlbum(Album album);
	//删除相册
	public int deleteAlbum(int id);
	//修改相册名称
	public int updateAlbumName(Album album);
	//修改相册描述
	public int updateAlbumDesc(Album album);
	
}
