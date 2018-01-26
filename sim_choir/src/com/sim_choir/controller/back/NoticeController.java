package com.sim_choir.controller.back;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sim_choir.entity.Administrater;
import com.sim_choir.entity.Announcement;
import com.sim_choir.service.AnnouncementService;

/**
 * 公告处理
 * @author Charles
 *
 */
@Controller
@RequestMapping("/back")
public class NoticeController {

	@Resource
	private AnnouncementService annoService;
	
	//删除公告
	@RequestMapping("/deleteAnno")
	public String deleteAnnouncement(HttpServletRequest request){
		//获取删除id
		String id = request.getParameter("annoId");
		if(id!=null){
			annoService.delete(Integer.parseInt(id));
		}
		return "redirect:/back/notice.html";
	}
	
	//修改公告名称
	@RequestMapping("/updateNoticeTittle")
	public String updateNoticeTittle(HttpServletRequest request){
		//获取id和修改后的名称
		String id=request.getParameter("id");
		String tittle=request.getParameter("tittle");
		if(id!=null && tittle!=null){
			Announcement anno = new Announcement();
			anno.setId(Integer.parseInt(id));
			anno.setTittle(tittle);
			//修改标题
			annoService.updateTittle(anno);
		}
		return "redirect:/back/notice-edit.html?annoId="+id;
	}
	
	//修改公告内容
	@RequestMapping("/updateNoticeContent")
	public String updateNoticeContent(HttpServletRequest request){
		//获取id和修改后的内容
		String id=request.getParameter("id");
		String content=request.getParameter("content");
		if(id!=null && content!=null){
			Announcement anno = new Announcement();
			anno.setId(Integer.parseInt(id));
			anno.setContent(content);
			//修改内容
			annoService.updateContent(anno);
		}
		return "redirect:/back/notice-edit.html?annoId="+id;
	}
	
	//創建公告
	@RequestMapping("/addNotice")
	public String addNotice(HttpServletRequest request){
		String tittle = request.getParameter("tittle");
		String content = request.getParameter("content");
		String adminId=request.getParameter("adminId");
		Administrater admin = new Administrater();
		admin.setId(Integer.parseInt(adminId));
		
		if(tittle!=null && content!=null){
			Announcement anno = new Announcement();
			anno.setContent(content);
			anno.setTittle(tittle);
			anno.setAdmin(admin);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			
			anno.setDate(df.format(new Date(System.currentTimeMillis())));
			//添加
			annoService.add(anno);
		}
		
		return "redirect:/back/notice.html";
	}
	
	
}
