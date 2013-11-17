package com.qianyan.dao;

import java.util.List;

import com.qianyan.entity.User;

public interface UserDao extends BaseDao<User, Integer> {
	public User getByName(String name);
	public List<String> listAllEmail();
}
