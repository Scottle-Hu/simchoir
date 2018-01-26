package com.sim_choir.dao;

import java.util.List;

import com.sim_choir.entity.Member;

/**
 * member类有关的dao
 * @author Charles
 *
 */
public interface MemberDao {

	//获取所有成员
	public List<Member> findAll();
	
	//根据id获取成员
	public Member findById(int id);
	
	//根据previewOrder按顺序获取
	public List<Member> findByPreview();
	
	//添加成员
	public int addMember(Member member);
	
	//删除成员
	public int delete(int id);
	
	//修改成员姓名
	public int updateName(Member member);
	
	//修改成员职务
	public int updateDuty(Member member);
	
	//修改成员班级
	public int updateClass(Member member);
	
	//修改成员声部
	public int updatePart(Member member);
	
	//修改成员图片
	public int updatePic(Member member);
	
	//修改预览优先级‘’
	public int updatePreviewOrder(Member member);
}
