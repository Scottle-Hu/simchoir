package com.sim_choir.dao;

import java.util.List;

import com.sim_choir.entity.Picture;

/**
 * 图片类dao
 * @author Charles
 *
 */
public interface PictureDao {

	//获取所有图片
	public List<Picture> findAll();
	//按相册id获取图片
	public List<Picture> findByAlbum(int albumId);
	//按照图片id获取
	public Picture findById(int id);
	//添加图片
	public int add(Picture pic);
	//按id删除图片
	public int delete(int id);
}
