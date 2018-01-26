package com.sim_choir.controller.back;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sim_choir.entity.Administrater;
import com.sim_choir.entity.News;
import com.sim_choir.service.NewsService;

/**
 * 新闻处理
 * @author Charles
 *
 */
@Controller
@RequestMapping("/back")
public class NewsController {

	@Resource
	private NewsService newsService;
	
	//删除新闻
	@RequestMapping("/deleteNews")
	public String deleteNews(HttpServletRequest request){
		//获取id
		String id = request.getParameter("newsId");
		if(id!=null){
			//调用service删除
			newsService.delete(Integer.parseInt(id));
		}
		return "redirect:/back/news.html";
	}
	
	//添加新闻
	@RequestMapping("/addNews")
	public String addNews(@RequestParam("pic") MultipartFile pic,HttpServletRequest request) throws IOException{
		//获取属性
		String tittle = request.getParameter("tittle");
		String content = request.getParameter("content");
		String presentation = request.getParameter("presentation");
		String adminId=request.getParameter("adminId");
		
		if(tittle!=null && content!=null && presentation!=null && adminId!=null && !pic.isEmpty()){
			News news = new News();
			news.setContent(content);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			
			news.setDate(df.format(new Date(System.currentTimeMillis())));
			news.setPic(pic.getBytes());
			news.setPraiseNum(0);
			news.setPresentation(presentation);
			news.setScanNum(0);
			news.setTittle(tittle);
			Administrater admin = new Administrater();
			admin.setId(Integer.parseInt(adminId));
			news.setAdmin(admin);
			
			newsService.add(news);
		}
		return "redirect:/back/news.html";
	}
}
