package com.sim_choir.controller.back;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sim_choir.entity.Introduction;
import com.sim_choir.service.HistoryService;
import com.sim_choir.service.IntroductionService;

/**
 * 简介和历史
 * @author Charles
 *
 */
@Controller
@RequestMapping("/back")
public class IntroAndHistoryController {

	@Resource
	private IntroductionService introductionService;
	@Resource
	private HistoryService historyService;
	
	//修改简介
	@RequestMapping("/saveIntro")
	public String saveIntro(HttpServletRequest request){
		String introdution = request.getParameter("introdution");
		String presentation = request.getParameter("presentation");
		if(introdution!=null && presentation!=null){
			Introduction intro = new Introduction();
			intro.setIntrodution(introdution);
			intro.setPresentation(presentation);
			
			introductionService.setIntroduction(intro);
		}
		
		return "redirect:/back/intro-his.html";
	}
}
