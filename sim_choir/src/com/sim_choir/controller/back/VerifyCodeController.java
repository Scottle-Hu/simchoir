package com.sim_choir.controller.back;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sim_choir.util.VerifyCodeUtils;

/**
 * 验证码
 * @author Charles
 *
 */
@Controller
@RequestMapping("/back")
public class VerifyCodeController {

	//获取验证码图片
	@RequestMapping("/vericodeImg")
	public void veriCode(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String code = request.getParameter("code");
		if(code!=null){
			OutputStream out = response.getOutputStream();
			VerifyCodeUtils.outputImage(100, 40, out, code);
			out.flush();
			out.close();
		}
	}
	
	
	
}
