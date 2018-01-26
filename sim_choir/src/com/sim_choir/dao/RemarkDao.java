package com.sim_choir.dao;

import java.util.List;

import com.sim_choir.entity.Remark;

/**
 * 评论dao
 * @author Charles
 *
 */
public interface RemarkDao {

	//找到某条动态的评论
	public List<Remark> findNewsRemark(int id);
	
	//找到某个歌曲的评论
	public List<Remark> findSongRemark(int id);
	
	//增加评论
	public int addRemark(Remark remark);
	
	//获取所有评论
	public List<Remark> findAllRemark();
	
	//获取所有歌曲评论
	public List<Remark> findAllSongRemark();
	
	//获取所有动态评论
	public List<Remark> findAllNewsRemark();
	
	//删除评论
	public int deleteRemark(int id);
	
}
