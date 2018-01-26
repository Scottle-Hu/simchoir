package com.sim_choir.controller.back;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sim_choir.dao.ContactDao;
import com.sim_choir.entity.Contact;

/**
 * 设置联系方式
 * @author Charles
 *
 */
@Controller
@RequestMapping("/back")
public class ContactContoller {

	@Resource
	private ContactDao contactDao;
	
	@RequestMapping("/updateContact")
	public String updateContact(@RequestParam(value="weixin",required=false) MultipartFile weixin,HttpServletRequest request) throws IOException{
		String room = request.getParameter("room");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String email = request.getParameter("email");
		
		if(room!=null && tel1!=null && tel2!=null && tel3!=null){
			Contact contact = new Contact();
			contact.setEmail(email);
			contact.setRoom(room);
			contact.setTel1(tel1);
			contact.setTel2(tel2);
			contact.setTel3(tel3);
			if(weixin==null || weixin.isEmpty()){
				contact.setWeixin(contactDao.find().getWeixin());
			}else{
				contact.setWeixin(weixin.getBytes());
			}
			
			contactDao.update(contact);
		}
		
		return "redirect:/back/contact.html";
	}
	
	//设置指挥特辑
	@RequestMapping("/saveConductor")
	public String saveConductor(HttpServletRequest request){
		String presentation = request.getParameter("presentation");
		if(presentation!=null){
			contactDao.updatePreOfConductor(presentation);
		}
		
		return "redirect:/back/conductor.html";
	}
}
