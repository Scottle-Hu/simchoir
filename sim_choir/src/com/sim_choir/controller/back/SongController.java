package com.sim_choir.controller.back;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sim_choir.entity.Song;
import com.sim_choir.service.SongService;

/**
 * 歌曲处理
 * 
 * @author Charles
 * 
 */
@Controller
@RequestMapping("/back")
public class SongController {

	@Resource
	private SongService songService;

	// 删除歌曲
	@RequestMapping("/deleteSong")
	public String deleteSong(HttpServletRequest request) {
		/*// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			return "redirect:/back/login.html";
		}*/
		// 获取删除的id
		String id = request.getParameter("songId");
		if (id != null) {
			songService.deleteSong(Integer.parseInt(id));
		}

		return "redirect:/back/song.html";
	}

	// 添加歌曲
	@RequestMapping("/addSong")
	public String addSong(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request) throws IOException {
		/*// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			return "redirect:/back/login.html";
		}*/
		// 获取各个参数
		String name = request.getParameter("name");
		String introduction = request.getParameter("introduction");
		String type = request.getParameter("type");
		int isLink = -1, isVideo = -1;
		String link = null;
		if (type.equals("3")) { // 链接类型
			isLink = 1;
			isVideo = 0;
			link = request.getParameter("link");
		} else if (type.equals("1")) { // 音频
			isLink = 0;
			isVideo = 0;
		} else if (type.equals("2")) { // 视频
			isLink = 0;
			isVideo = 1;
		}

		if (name != null && introduction != null
				&& ((type.equals("3") && link != null) || (!file.isEmpty() && (type.equals("1") || type.equals("2"))))) {
			Song song = new Song();
			song.setIntroduction(introduction);
			song.setIsLink(isLink);
			song.setIsVideo(isVideo);
			song.setName(name);
			song.setPraiseNum(0);
			song.setScanNum(0);
			song.setContent(type.equals("3")?link.getBytes():file.getBytes());
			
			songService.add(song);
		}

		return "redirect:/back/song.html";
	}

}
