package com.sim_choir.controller.back;

import java.io.IOException;
import java.io.OutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sim_choir.dao.ContactDao;
import com.sim_choir.entity.Contact;
import com.sim_choir.entity.Member;
import com.sim_choir.entity.News;
import com.sim_choir.entity.Picture;
import com.sim_choir.service.MemberService;
import com.sim_choir.service.NewsService;
import com.sim_choir.service.PictureService;
import com.sim_choir.util.VerifyCodeUtils;

/**
 * 图片io有关的控制器（后台使用）
 * @author Charles
 *
 */
@Controller
@RequestMapping("/back/imageIO")
public class BackImageIOController {
	
	@Resource
	private NewsService newsService;
	@Resource
	private MemberService memberService;
	@Resource
	private PictureService pictureService;
	@Resource
	private ContactDao contactDao;
	
	//根据id获取动态封面
	@RequestMapping("/newsImage")
	public void getNewsImage(HttpServletRequest request,HttpServletResponse response){
		//获取id参数
		int id = Integer.parseInt(request.getParameter("newsId"));
		OutputStream out = null;
		
		try {
			out = response.getOutputStream();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//获取news对象
		News news = newsService.getById(id);
		if(news==null){
			try {
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return;
		}
		//获取封面图片的字节数组
		byte[] pic = news.getPic();
		
		try {
			//写到页面
			out.write(pic);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//获取成员的图片
	@RequestMapping("/memberImage")
	public void getMemberImage(HttpServletRequest request,HttpServletResponse response){
		//获取成员ID
		int id = Integer.parseInt(request.getParameter("memberId"));
		
		//查找成员
		Member member = memberService.getById(id);
		
		//获取头像图片字节数组
		byte[] photo = member.getPhoto();
		
		//获取响应输出流
		OutputStream out=null;
		try {
			out = response.getOutputStream();
		} catch (IOException e) {
			return;
		}
		try {
			out.write(photo);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				out.close();
				return;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	//获取图片
	@RequestMapping("/picImage")
	public void getPicImage(HttpServletRequest request,HttpServletResponse response){
		//获取图片id
		int id = Integer.parseInt(request.getParameter("picId"));
		Picture pic = pictureService.getById(id);
		byte[] image=pic.getPic();//获取图片的字节数组
		OutputStream out = null;
		try {
			out = response.getOutputStream();
		} catch (IOException e) {
			e.printStackTrace();
			return;
		}
		try {
			out.write(image);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return;
	}
	
	//获取微信二维码
	@RequestMapping("/contactImage")
	public void contactImage(HttpServletResponse response) throws IOException{
		Contact contact = contactDao.find();
		byte[] pic = contact.getWeixin();
		OutputStream out = response.getOutputStream();
		out.write(pic);
		out.flush();
		out.close();
		
	}
	
	
}
