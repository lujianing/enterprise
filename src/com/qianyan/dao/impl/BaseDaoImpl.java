package com.qianyan.dao.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;


import com.qianyan.dao.BaseDao;


public class BaseDaoImpl<T,ID extends Serializable> implements BaseDao<T, ID> {
		
	private HibernateTemplate hibernateTemplate; 
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	@Resource(name="hibernateTemplate")
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public void save(T entity) {		
		hibernateTemplate.save(entity);			
	}

	public void delete(T entity) {
		hibernateTemplate.delete(entity);
		
	}

	public void deleteById(Class<T> entityClass, ID id) {
		delete(this.findById(entityClass, id));
		
	}

	public void update(T entity) {
		hibernateTemplate.update(entity);
		
	}
	
	
	

	
	public T findById(Class<T> entityClass, ID id) {
		return (T)hibernateTemplate.get(entityClass, id);
	}

	
	public List<T> findAll(Class<T> entityClass) {
		String name = entityClass.getName();
		System.out.println(name);
		return hibernateTemplate.find("from "+name);
	}

}
