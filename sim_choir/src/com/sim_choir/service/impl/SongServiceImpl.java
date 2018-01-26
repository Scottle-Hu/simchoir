package com.sim_choir.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sim_choir.dao.SongDao;
import com.sim_choir.entity.Remark;
import com.sim_choir.entity.Song;
import com.sim_choir.service.SongService;
/**
 * SongService实现
 * @author Charles
 *
 */
@Service("SongService")
public class SongServiceImpl implements SongService {
	
	@Resource
	private SongDao songDao;
	
	@Override
	public List<Song> getPreview() {
		List<Song> resultList = new ArrayList<Song>();
		//获取所有歌曲列表
		List<Song> songs = songDao.findAll();
		//如果超过四个歌曲，就取前四个，负责不够的为空
		if(songs.size()>=4){
			for(int i = 0;i<4;i++){
				resultList.add(songs.get(songs.size()-i-1));
			}
		}else{
			for(int i = 0;i<songs.size();i++){
				resultList.add(songs.get(songs.size()-i-1));
			}
			for(int i = 0;i<4-songs.size();i++){
				Song nullSong = new Song();
				nullSong.setName("暂无歌曲");
				nullSong.setIntroduction("没有更多歌曲了");
				nullSong.setId(-1);  //用于在听歌链接处判断
				resultList.add(nullSong);
			}
		}
		return resultList;
	}

	@Override
	public List<Song> getAllSongs() {
		List<Song> resultList = new ArrayList<Song>();
		//获取所有歌曲列表
		List<Song> songs = songDao.findAll();
		for(int i =songs.size()-1;i>=0;i--){
			resultList.add(songs.get(i));
		}
		return resultList;
	}

	@Override
	public Song getById(int id) {
		Song song = songDao.findById(id).get(0);
		List<Remark> remarkList = new ArrayList<Remark>();
		List<Remark> remarks = song.getRemarkList();
		for(int i=0;i<remarks.size();i++){
			remarkList.add(remarks.get(remarks.size()-i-1));
		}
		song.setRemarkList(remarkList);
		return song;
	}

	@Override
	public int updatePraiseNum(int id) {
		return songDao.updatePraiseNum(id);
	}

	@Override
	public int updateScanNum(int id) {
		return songDao.updateScanNum(id);
	}

	@Override
	public int deleteSong(int id) {
		return songDao.deleteSong(id);
	}

	@Override
	public int add(Song song) {
		return songDao.addSong(song);
	}
	
	

}
