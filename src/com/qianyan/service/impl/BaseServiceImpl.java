package com.qianyan.service.impl;

import java.io.Serializable;
import java.util.List;

import com.qianyan.bean.PageBean;
import com.qianyan.service.BaseService;

public class BaseServiceImpl<T, ID extends Serializable> implements BaseService<T, ID>{
	
	
	public void save(T entity) {
		// TODO Auto-generated method stub
		
	}

	
	public void delete(T entity) {
		// TODO Auto-generated method stub
		
	}

	
	public void deleteById(Class<T> entityClass, ID id) {
		// TODO Auto-generated method stub
		
	}

	
	public void update(T entity) {
		// TODO Auto-generated method stub
		
	}

	
	public T findById(Class<T> entityClass, ID id) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public List<T> findAll(Class<T> entityClass) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public PageBean queryForPage(int pageSize, int page, String sort) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
