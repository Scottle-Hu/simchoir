package com.sim_choir.controller;

import java.io.IOException;
import java.io.OutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sim_choir.entity.Song;
import com.sim_choir.service.SongService;

/**
 * 获取歌曲文件io的控制器
 * @author Charles
 *
 */
@Controller
@RequestMapping("/songIO")
public class SongIOController {

	@Resource
	private SongService songService;
	
	//按照id获取歌曲的文件io
	@RequestMapping("/getSong")
	public void getSong(HttpServletRequest request ,HttpServletResponse response) throws IOException{
		//获取id
		int id = Integer.parseInt(request.getParameter("songId"));
		//获取song对象
		Song song = songService.getById(id);
		//获取歌曲文件（视频或音频）
		byte[] file = song.getContent();
		//获取io流
		OutputStream out = response.getOutputStream();
		out.write(file); //传递给页面
		out.flush();
		out.close();
		
	}
}
