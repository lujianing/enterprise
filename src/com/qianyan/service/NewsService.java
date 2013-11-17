package com.qianyan.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;


import com.qianyan.bean.PageBean;
import com.qianyan.dao.NewsDao;
import com.qianyan.dao.PageDao;
import com.qianyan.dao.VideoDao;
import com.qianyan.entity.News;
import com.qianyan.entity.Video;


/**
 * service 是业务逻辑层 
 * 次层负责一系列的业务逻辑
 * 比如删除照片删除数据库信息  删除文件信息等
 * author：鲁家宁
 * */
@Component("newsservice")
public class NewsService {
	
	private NewsDao newsdao;
	private PageDao pagedao;
	public PageDao getPagedao() {
		return pagedao;
	}
	@Resource(name="pageDao")
	public void setPagedao(PageDao pagedao) {
		this.pagedao = pagedao;
	}

	public NewsDao getNewsdao() {
		return newsdao;
	}
	
	@Resource(name="newsDao")
	public void setNewsdao(NewsDao newsdao) {
		this.newsdao = newsdao;
	}

	public void addNews(News news){
		newsdao.save(news);
	}
	
	/**
	 * 更新视频
	 *return true代表成功 false代表失败
	 * */
	public boolean updateNews(News news){
		newsdao.update(news);
		 return true;
	}
	
	public News getNewsByID(int id){
		News news =newsdao.GetandUpdate(id);
		return news;
	}
	
	/**
	 * 列出全部的视频
	 * return list集合
	 * */
	public List<News> listNews(){
		return newsdao.findAll(News.class);
	}
	
	/**
	 * 删除视频
	 * return true代表删除成功 false代表删除失败
	 * */
	
	public boolean deleteByID(int id){
		News news = getNewsByID(id);
		if(news==null)
			return false;
		
		newsdao.delete(news);
		return true;
	}
	
	/**
	 * 根据类别查VIDEO
	 * */
	public List<News> listByTypeID(int typeid){
		return newsdao.listByTypeid(typeid);
	}
	
	/**
	 * 列出部分视频
	 * return list集合
	 * */
	public List<News> listNews(int i){
		return newsdao.listNews(i);
	}
	
	/**
	 * 根据video名字查询video
	 * */
	public News findByName(String s){
		return newsdao.findByName(s);
	}
	
	/**
	 * 查询点击排行
	 * */
	public List<News> listVideoByClick(int i){
		return newsdao.listByClick(i);
	}
	
	public PageBean queryForPage(int pageSize, int page,String sort) {

		final String hql = "from News  order by uptime "+sort;// 查询语句
		int allRow = pagedao.getAllRowCount(hql);// 总记录数
		System.out.println(allRow);
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数
		final int offset = PageBean.countOffset(pageSize, page);// 当前页开始记录
		final int length = pageSize;// 每页记录数
		final int currentPage = PageBean.countCurrentPage(page);
		List<News> list = pagedao.queryForPage(News.class,hql, offset, length);// "一页"的记录

		PageBean pagebean = new PageBean();
		pagebean.setPageSize(pageSize);
		pagebean.setCurrentPage(currentPage);
		pagebean.setAllRow(allRow);
		pagebean.setTotalPage(totalPage);
		pagebean.setList(list);
		pagebean.init();
		return pagebean;
	}
	
}
