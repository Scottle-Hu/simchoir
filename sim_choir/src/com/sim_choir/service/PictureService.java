package com.sim_choir.service;

import java.util.List;

import com.sim_choir.entity.Picture;

/**
 * 图片业务处理
 * @author Charles
 *
 */
public interface PictureService {

	//获取所有图片
	public List<Picture> getAll();
	//按照相册获取图片
	public List<Picture> getByAlbum(int albumId);
	//id获取
	public Picture getById(int id);
	//添加图片
	public int addPic(Picture pic);
	//按照id删除图片’
	public int delete(int id);
}
