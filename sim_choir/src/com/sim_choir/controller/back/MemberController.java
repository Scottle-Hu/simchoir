package com.sim_choir.controller.back;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sim_choir.entity.Member;
import com.sim_choir.service.MemberService;

/**
 * 成员处理
 * 
 * @author Charles
 * 
 */
@Controller
@RequestMapping("/back")
public class MemberController {

	@Resource
	private MemberService memberService;

	// 批量删除成员
	@RequestMapping("/deleteMember")
	public String deleteMember(HttpServletRequest request) {

		// 获取删除的id
		String ids = request.getParameter("deleteIds");
		if (ids != null) {
			ArrayList<Integer> idList = new ArrayList<Integer>();
			while (ids.length() > 0) {
				int index = ids.indexOf(")(");
				idList.add(Integer.parseInt(ids.substring(0, index)));
				ids = ids.substring(index + 2);
			}
			// 调用service删除成员
			memberService.deleteMembers(idList);
		}

		return "redirect:/back/member.html";
	}

	// 添加成员
	@RequestMapping("/addMember")
	public String addMember(@RequestParam("pic") MultipartFile file, HttpServletRequest request) throws IOException {
		// 获取各种参数
		String name = request.getParameter("name");
		String grade = request.getParameter("grade");
		String major = request.getParameter("major");
		String duty = request.getParameter("duty");
		String part = request.getParameter("part");
		if (part.equals("1")) {
			part = "S";
		} else if (part.equals("2")) {
			part = "A";
		} else if (part.equals("3")) {
			part = "T";
		} else if (part.equals("4")) {
			part = "B";
		}
		// 添加成员
		if (name != null && grade != null && major != null && duty != null && part != null) {
			Member member = new Member();
			member.setDutyId(Integer.parseInt(duty));
			member.setGrade(2000 + (new Date()).getYear() % 100 + 1 - Integer.parseInt(grade));
			member.setMajorId(Integer.parseInt(major));
			member.setName(name);
			member.setPhoto(file.getBytes());
			member.setPart(part);
			member.setPreviewOrder(0);
			// 调用service添加成员
			memberService.add(member);
		}
		return "redirect:/back/member.html";
	}

	// 修改成员姓名
	@RequestMapping("/updateMemberName")
	public String updateMemberName(HttpServletRequest request) {
		// 获取修改后的姓名
		String name = request.getParameter("name");
		// 获取id
		String id = request.getParameter("id");
		if (id != null && name != null) {
			Member member = new Member();
			member.setId(Integer.parseInt(id));
			member.setName(name);
			// 调用service
			memberService.updateName(member);
		}
		return "redirect:/back/member.html";
	}

	// 修改成员职务
	@RequestMapping("/updateMemberDuty")
	public String updateMemberDuty(HttpServletRequest request) {
		// 获取id和职务编号
		String id = request.getParameter("id");
		String dutyId = request.getParameter("duty");
		if (id != null && dutyId != null) {
			// 创建成员
			Member member = new Member();
			member.setDutyId(Integer.parseInt(dutyId));
			member.setId(Integer.parseInt(id));
			// 修改
			memberService.updateDuty(member);
		}
		return "redirect:/back/member.html";
	}

	// 修改成员班级
	@RequestMapping("/updateMemberClass")
	public String updateMemberClass(HttpServletRequest request) {
		// 获取id和修改后的值
		String id = request.getParameter("id");
		String grade = request.getParameter("grade");
		String major = request.getParameter("major");
		if (id != null && grade != null && major != null) {
			// 创建成员
			Member member = new Member();
			member.setId(Integer.parseInt(id));
			member.setMajorId(Integer.parseInt(major));
			member.setGrade(2000 + (new Date()).getYear() % 100 + 1 - Integer.parseInt(grade));

			memberService.updateClass(member);
		}
		return "redirect:/back/member.html";
	}

	// 修改成员声部
	@RequestMapping("/updateMemberPart")
	public String updateMemberPart(HttpServletRequest request) {
		// 获取id和声部
		String id = request.getParameter("id");
		String part = request.getParameter("part");
		if (part.equals("1")) {
			part = "S";
		} else if (part.equals("2")) {
			part = "A";
		} else if (part.equals("3")) {
			part = "T";
		} else if (part.equals("4")) {
			part = "B";
		}
		if (id != null && part != null) {
			// 创建成员
			Member member = new Member();
			member.setId(Integer.parseInt(id));
			member.setPart(part);
			// 修改
			memberService.updatePart(member);
		}
		return "redirect:/back/member.html";
	}

	// 修改成员图片
	@RequestMapping("/updateMemberPic.html")
	public String updatePicSubmit(@RequestParam("photo") MultipartFile file, HttpServletRequest request)
			throws IOException {
		String id = request.getParameter("id");
		if (id != null && !file.isEmpty()) {
			Member member = new Member();
			member.setId(Integer.parseInt(id));
			member.setPhoto(file.getBytes());

			memberService.updatePic(member);
		}

		return "redirect:/back/member.html";
	}

	// 更新预览成员
	@RequestMapping("/updatePreview")
	public String updatePreview(HttpServletRequest request) {
		// 获取id和selectid
		String id = request.getParameter("id");
		String selectId = request.getParameter("selectId");
		if(id!=null && selectId!=null){
			//获取原来的成员
			Member m1 = memberService.getById(Integer.parseInt(id));
			Member m2 = memberService.getById(Integer.parseInt(selectId));
			//交换preview
			int t = m1.getPreviewOrder();
			m1.setPreviewOrder(m2.getPreviewOrder());
			m2.setPreviewOrder(t);
			//更新
			memberService.updatePreviewOrder(m1);
			memberService.updatePreviewOrder(m2);
		}
		return "redirect:/back/member.html";
	}
	
	// 设置预览成员（当没有预览成员时）
	@RequestMapping("/setPreview")
	public String setPreview(HttpServletRequest request) {
		// 获取previewOrder和selectid
		String previewOrder = request.getParameter("previewOrder");
		String selectId = request.getParameter("selectId");
		if(previewOrder!=null && selectId!=null){
			//获取原来的成员
			Member m2 = memberService.getById(Integer.parseInt(selectId));
			//交换preview
			m2.setPreviewOrder(Integer.parseInt(previewOrder));
			//更新
			memberService.updatePreviewOrder(m2);
		}
		return "redirect:/back/member.html";
	}
}
