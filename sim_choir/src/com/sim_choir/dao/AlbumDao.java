package com.sim_choir.dao;

import java.util.List;

import com.sim_choir.entity.Album;

/**
 * 相册dao
 * @author Charles
 *
 */
public interface AlbumDao {

	//获取所有相册
	public List<Album> findAll();
	//按照id获取相册(单元素集合)
	public List<Album> findById(int id);
	//添加相册
	public int add(Album album);
	//删除相册
	public int deleteAlbum(int id);
	//修改相册名称
	public int updateAlbumName(Album album);
	//修改相册描述
	public int updateAlbumDesc(Album album);
	
}
