package com.sim_choir.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sim_choir.dao.MemberDao;
import com.sim_choir.entity.Member;
import com.sim_choir.service.MemberService;
/**
 * MemberService实现
 */
@Service("MemberService")
public class MemberServiceImpl  implements MemberService{

	@Resource
	private MemberDao memberDao;
	
	@Override
	public List<Member> getPreview() {
		return memberDao.findByPreview();
	}

	@Override
	public Member getById(int id) {
		return memberDao.findById(id);
	}

	@Override
	public List<Member> getAll() {
		return memberDao.findAll();
	}

	@Override
	public int deleteMembers(List<Integer> ids) {
		int result = 0;
		//删除所有id的成员
		for(int id:ids){
			result+=memberDao.delete(id);
		}
		return result;
	}

	@Override
	public int add(Member member) {
		return memberDao.addMember(member);
	}

	@Override
	public int updateName(Member member) {
		return memberDao.updateName(member);
	}

	@Override
	public int updateDuty(Member member) {
		return memberDao.updateDuty(member);
	}

	@Override
	public int updateClass(Member member) {
		return memberDao.updateClass(member);
	}

	@Override
	public int updatePart(Member member) {
		return memberDao.updatePart(member);
	}

	@Override
	public int updatePic(Member member) {
		return memberDao.updatePic(member);
	}

	@Override
	public int updatePreviewOrder(Member member) {
		return memberDao.updatePreviewOrder(member);
	}

}
