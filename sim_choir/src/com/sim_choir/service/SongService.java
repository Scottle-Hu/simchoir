package com.sim_choir.service;

import java.util.List;

import com.sim_choir.entity.Song;

/**
 * 歌曲有关的的service
 */
public interface SongService {

	//获取首页显示的四个歌曲预览
	public List<Song> getPreview();
	
	//获取所有歌曲列表
	public List<Song> getAllSongs();
	
	//按id获取歌曲
	public Song getById(int id);
	
	//歌曲点赞加一
	public int updatePraiseNum(int id);
	
	//歌曲浏览加一
	public int updateScanNum(int id);
	
	//删除歌曲
	public int deleteSong(int id);
	
	//添加歌曲
	public int add(Song song);
}
