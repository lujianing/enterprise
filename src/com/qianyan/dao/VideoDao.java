package com.qianyan.dao;

import java.util.List;

import com.qianyan.entity.Video;

public interface VideoDao extends BaseDao<Video, Integer> {
	/**
	 * 降序列出i个video
	 * */
	public List<Video> listVideo(int i);		
	/**
	 * 根据类别进行查询
	 * */
	public List<Video> listByTypeid(int id);
	
	/**
	 * 列出点击排行前i个
	 * */
	public List<Video> listByClick(int i);
	
	/**
	 * 列出下载排行前i个
	 * */
	public List<Video> listByDownload(int i);
	
	public Video findByName(String s);
	
	public Video GetandUpdate(int id);
	
	public Video GetAndUpdateDown(int id);
}
