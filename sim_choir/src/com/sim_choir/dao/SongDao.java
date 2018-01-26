package com.sim_choir.dao;

import java.util.List;

import com.sim_choir.entity.Song;

/**
 * 与歌曲有关的dao
 * @author Charles
 *
 */
public interface SongDao {

	//添加歌曲
	public int addSong(Song song);
	
	//获取所有歌曲集合(用于预览)
	public List<Song> findAll();
	
	//获取所有歌曲集合
	public List<Song> findAllWithSong();
	
	//根据id获取歌曲
	public List<Song> findById(Integer id);
	
	//歌曲的praiseNum+1
	public int updatePraiseNum(int id);
	
	//歌曲浏览加一
	public int updateScanNum(int id);
	
	//删除歌曲
	public int deleteSong(int id);
	
	//通过评论的id反向获取歌曲名称
	public String findNameByRemark(int id);
}
