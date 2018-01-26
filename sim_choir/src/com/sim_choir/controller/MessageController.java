package com.sim_choir.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sim_choir.dao.MessageDao;
import com.sim_choir.entity.Message;

/**
 * 消息处理
 * @author Charles
 *
 */
@Controller
public class MessageController {

	@Resource
	private MessageDao messageDao;
	
	@RequestMapping("/addMessage")
	public String addMessage(HttpServletRequest request){
		//获取参数
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String email = request.getParameter("email");
		String message = request.getParameter("message");
		
		if(message!=null && name!=null && phone!=null && email!=null){
			Message newmessage = new Message();
			newmessage.setEmail(email.equals("E-mail:")?"":email);
			newmessage.setMessage(message);
			newmessage.setName(name.equals("Name:")?"":name);
			newmessage.setPhone(phone.equals("Phone:")?"":phone);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			newmessage.setDate(df.format(new Date(new java.util.Date().getTime())));
			
			messageDao.add(newmessage);
		}
		
		return "redirect:contact.html";
	}
	
	//删除
	@RequestMapping("/back/deleteMessage")
	public String deleteMessage(HttpServletRequest request){
		String id=request.getParameter("messageId");
		if(id!=null){
			messageDao.delete(Integer.parseInt(id));
			
		}
		return "redirect:/back/message.html";
	}
	
	
}
