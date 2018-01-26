package com.sim_choir.dao;

import java.util.List;

import com.sim_choir.entity.Message;

/**
 * 消息dao
 * @author Charles
 *
 */
public interface MessageDao {

	//获取所有消息
	public List<Message> findAll();
	
	//按id获取消息
	public Message findById(int id);
	
	//添加消息
	public int add(Message message);
	
	//获取所有已读消息
	public List<Message> findAlready();
	
	//获取已读消息的条数
	public int findNumOfAlready();
	
	//获取所有未读消息
	public List<Message> findWait();
	
	//获取未读消息的条数
	public int findNumOfWait();
	
	//读取消息
	public int read(int id);
	
	//删除消息
	public int delete(int id);
	
	
}
