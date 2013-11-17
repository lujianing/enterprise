package com.qianyan.service;

import java.util.List;

import com.qianyan.entity.Picture;

public interface PictureService extends BaseService<Picture, Integer> {
	public List<Picture> listbynum(int num,String sort);
}
