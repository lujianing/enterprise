package com.qianyan.dao;

import java.util.List;

import com.qianyan.entity.Picture;


public interface PictureDao extends BaseDao<Picture, Integer>{
	public List<Picture> listbynum(int num,String sort);
}
