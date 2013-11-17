package com.qianyan.dao.impl;

import org.springframework.stereotype.Component;

import com.qianyan.dao.CompanyDao;
import com.qianyan.dao.MessageDao;
import com.qianyan.entity.Message;
@Component("messageDao")
public class MessageDaoImpl extends BaseDaoImpl<Message, Integer> implements MessageDao{
	
}
