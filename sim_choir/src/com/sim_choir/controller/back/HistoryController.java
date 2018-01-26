package com.sim_choir.controller.back;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sim_choir.entity.History;
import com.sim_choir.service.HistoryService;

/**
 * 
 * @author Charles
 *
 */
@Controller
@RequestMapping("/back")
public class HistoryController {
	
	@Resource
	private HistoryService historyService;
	

	//删除历史
	@RequestMapping("/deleteHistory")
	public String deleteHistory(HttpServletRequest request){
		String id = request.getParameter("id");
		if(id!=null){
			historyService.delete(Integer.parseInt(id));
		}
		return "redirect:/back/intro-his.html";
	}
	
	//添加历史
	@RequestMapping("/addHistory")
	public String addHistory(HttpServletRequest request){
		
		String syear1 = request.getParameter("syear1");
		String syear2 = request.getParameter("syear2");
		String syear3 = request.getParameter("syear3");
		String syear4 = request.getParameter("syear4");
		String smonth1 = request.getParameter("smonth1");
		String smonth2 = request.getParameter("smonth2");
		String sdate1 = request.getParameter("sdate1");
		String sdate2 = request.getParameter("sdate2");
		String eyear1 = request.getParameter("eyear1");
		String eyear2 = request.getParameter("eyear2");
		String emonth1 = request.getParameter("emonth1");
		String emonth2= request.getParameter("emonth2");
		String edate1 = request.getParameter("edate1");
		String edate2 = request.getParameter("edate2");
		String eyear3 = request.getParameter("eyear3");
		String eyear4 = request.getParameter("eyear4");
		String content = request.getParameter("content");
		String presentation = request.getParameter("presentation");
		String sdate = syear1+syear2+syear3+syear4+"-"+smonth1+smonth2+"-"+sdate1+sdate2+" 00:00:00";
		String edate = eyear1+eyear2+eyear3+eyear4+"-"+emonth1+emonth2+"-"+edate1+edate2+" 00:00:00";
		
		if(content!=null && presentation!=null ){
			History history = new History();
			history.setSdate(sdate);
			history.setEdate(edate);
			history.setContent(content);
			history.setPresentation(presentation);
			
			historyService.add(history);
		}
		
		return "redirect:/back/intro-his.html";
	}
}
