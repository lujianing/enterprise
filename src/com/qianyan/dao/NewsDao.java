package com.qianyan.dao;

import java.util.List;

import com.qianyan.entity.News;
import com.qianyan.entity.Video;

public interface NewsDao extends BaseDao<News, Integer> {
	public List<News> listByTypeid(int id);
	public List<News> listNews(int i);
	
	public News findByName(String s);
	
	public List<News> listByClick(int i);
	
	public News GetandUpdate(int id);
}
