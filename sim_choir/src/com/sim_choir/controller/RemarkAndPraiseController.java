package com.sim_choir.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sim_choir.dao.RemarkDao;
import com.sim_choir.entity.Remark;
import com.sim_choir.entity.Song;
import com.sim_choir.service.NewsService;
import com.sim_choir.service.SongService;

/**
 * 点赞和评论（歌曲和动态）
 * @author Charles
 *
 */
@Controller
public class RemarkAndPraiseController {

	@Resource
	private SongService songService;
	@Resource
	private NewsService newsService;
	@Resource
	private RemarkDao remarkService;
	
	//歌曲点赞加一
	@RequestMapping("/updateSongPraise")
	public void updateSongPraise(HttpServletRequest request){
		String songId = request.getParameter("songId");
		if(songId!=null){
			int id = Integer.parseInt(songId);
			songService.updatePraiseNum(id);
		}
	}
	
	//动态点赞加一
	@RequestMapping("/updateNewsPraise")
	public void updateNewsPraise(HttpServletRequest request){
		String id = request.getParameter("newsId");
		if(id!=null){
			newsService.updatePraiseNum(Integer.parseInt(id));
		}
	}
	
	//新增歌曲评论
	@RequestMapping("/addSongRemark")
	public void addSongRemark(HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		//获取歌曲id
		String songId = request.getParameter("songId");
		//获取评论者ip
		String ip = request.getParameter("ip");
		//获取评论内容
		String remark = request.getParameter("remark");
		//建立reamrk
		Remark newRemark = new Remark();
		newRemark.setContent(remark);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		newRemark.setDate(df.format(new Date(System.currentTimeMillis())));
		newRemark.setIp(ip);
		newRemark.setItemId(Integer.parseInt(songId));
		newRemark.setIsNews(0);
		//update
		remarkService.addRemark(newRemark);	
	}
	
	//新增动态评论
	@RequestMapping("/addNewsRemark")
	public void addNewsRemark(HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		//获取新闻id
		String newsId = request.getParameter("newsId");
		//获取评论者ip
		String ip = request.getParameter("ip");
		//获取评论内容
		String remark = request.getParameter("remark");
		//建立reamrk
		Remark newRemark = new Remark();
		newRemark.setContent(remark);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		newRemark.setDate(df.format(new Date(System.currentTimeMillis())));
		newRemark.setIp(ip);
		newRemark.setItemId(Integer.parseInt(newsId));
		newRemark.setIsNews(1);
		//update
		remarkService.addRemark(newRemark);	
	}
	
	//删除评论
	@RequestMapping("/back/deleteRemark")
	public String deleteRemark(HttpServletRequest request){
		// 过滤
		if (request.getSession().getAttribute("admin") == null) {
			request.getSession().setAttribute("errorMsg", "登录过期，请重新登录");
			return "redirect:/back/login.html";
		}
		//获取id
		String id = request.getParameter("id");
		if(id!=null){
			remarkService.deleteRemark(Integer.parseInt(id));
		}
		return "redirect:/back/remark.html";
	}
}
