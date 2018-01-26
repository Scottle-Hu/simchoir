package com.sim_choir.service;

import java.util.List;

import com.sim_choir.entity.Member;

/**
 * member类service接口
 * @author Charles
 *
 */
public interface MemberService {

	//获取有序的预览成员集合
	public List<Member> getPreview();
	
	//根据id获取成员
	public Member getById(int id);
	
	//获取所有成员
	public List<Member> getAll();
	
	//删除一个id集合内的所有成员
	public int deleteMembers(List<Integer> ids);
	
	//添加成员
	public int add(Member member);
	
	//修改姓名
	public int updateName(Member member);
	
	//修改成员职务
	public int updateDuty(Member member);
	
	//修改成员班级
	public int updateClass(Member member);
	
	//修改成员声部
	public int updatePart(Member member);
	
	//修改成员图片
	public int updatePic(Member member);
	
	//修改预览优先级
	public int updatePreviewOrder(Member member);
}
