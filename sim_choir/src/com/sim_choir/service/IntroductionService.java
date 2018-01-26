package com.sim_choir.service;

import com.sim_choir.entity.Introduction;

/**
 * 
 * @author Charles
 *
 */
public interface IntroductionService {

	//获取简介
	public Introduction get();
	
	//修改简介
	public void setIntroduction(Introduction introduction);
}
