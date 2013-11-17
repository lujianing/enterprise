package com.qianyan.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Component;

import com.qianyan.dao.CompanyDao;
import com.qianyan.dao.NewsDao;
import com.qianyan.entity.CompanyInfo;
import com.qianyan.entity.News;
import com.qianyan.entity.Video;
@Component("companyDao")
public class CompanyDaoImpl extends BaseDaoImpl<CompanyInfo, Integer> implements CompanyDao{
	
}
