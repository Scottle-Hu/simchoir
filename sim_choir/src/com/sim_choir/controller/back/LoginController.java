package com.sim_choir.controller.back;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sim_choir.entity.Administrater;
import com.sim_choir.service.AdminService;

/**
 * 登陆验证有关的controller
 * @author Charles
 *
 */
@Controller
@RequestMapping("/back")
public class LoginController {

	@Resource
	private AdminService adminService;
	
	//登陆请求
	@RequestMapping("/check")
	public String check(HttpServletRequest request){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		//查询数据库
		List<Administrater> admin = adminService.getByName(username);
		boolean hasUser = false;
		boolean pass = false;
		Administrater admin2 = null;
		for(Administrater ad:admin){
			if(ad.getUsername().equals(username)){
				hasUser=true;
				if(ad.getPassword().equals(password)){
					pass=true;
					admin2=ad;
					break;
				}
			}
		}
		if(!hasUser){
			request.getSession().removeAttribute("errorMsg");
			request.getSession().setAttribute("errorMsg", "该用户不存在！");
			return "redirect:/back/login.html";
		}else if(!pass){
			request.getSession().removeAttribute("errorMsg");
			request.getSession().setAttribute("errorMsg", "密码错误！");
			return "redirect:/back/login.html";
		}else{
			request.getSession().removeAttribute("admin");
			request.getSession().setAttribute("admin",admin2);
			request.getSession().setMaxInactiveInterval(60*60);//session过期时间
			return "redirect:/back/main.html";
		}
	}
	
	
}
