package com.sim_choir.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sim_choir.dao.IntroductionDao;
import com.sim_choir.entity.Introduction;
import com.sim_choir.service.IntroductionService;

/**
 * IntroductionService实现
 * @author Charles
 *
 */
@Service("IntroductionService")
public class IntroductionServiceImpl implements IntroductionService {

	@Resource
	private IntroductionDao introductionDao;
	
	@Override
	public Introduction get() {
		// TODO Auto-generated method stub
		return introductionDao.find();
	}

	@Override
	public void setIntroduction(Introduction introduction) {
		introductionDao.setIntroduction(introduction);
	}

}
