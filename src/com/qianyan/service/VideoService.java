package com.qianyan.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.qianyan.bean.PageBean;
import com.qianyan.dao.PageDao;
import com.qianyan.dao.VideoDao;
import com.qianyan.dao.impl.VideoDaoImpl;
import com.qianyan.entity.News;
import com.qianyan.entity.Video;


/**
 * service 是业务逻辑层 
 * 次层负责一系列的业务逻辑
 * 比如删除照片删除数据库信息  删除文件信息等
 * author：鲁家宁
 * */
@Component("videoservice")
public class VideoService {
	
	private VideoDao videodao;
	
	private PageDao pagedao;
	public PageDao getPagedao() {
		return pagedao;
	}
	@Resource(name="pageDao")
	public void setPagedao(PageDao pagedao) {
		this.pagedao = pagedao;
	}
	
	public VideoDao getVideodao() {
		return videodao;
	}
	@Resource(name="videoDao")
	public void setVideodao(VideoDao videodao) {
		this.videodao = videodao;
	}

	public void addVideo(Video video){
		videodao.save(video);
	}
	
	/**
	 * 更新视频
	 *return true代表成功 false代表失败
	 * */
	public boolean updateVideo(Video video){
		 videodao.update(video);
		 return true;
	}
	
	public Video getVideoByID(int id){
		
		Video video =videodao.GetandUpdate(id);
		
		return video;
	}
	
	public Video getVideoByIDNotUpdate(int id){
		Video video =videodao.findById(Video.class, id);
		
		return video;
	}
	
	public Video getandupdatedown(int id){
		Video video = videodao.GetAndUpdateDown(id);
		return video;
	}
	
	/**
	 * 列出全部的视频
	 * return list集合
	 * */
	public List<Video> listVideo(){
		return videodao.findAll(Video.class);
	}
	
	/**
	 * 删除视频
	 * return true代表删除成功 false代表删除失败
	 * */
	
	public boolean deleteByID(int id){
		Video video = getVideoByIDNotUpdate(id);
		if(video==null)
			return false;
		String path = ServletActionContext.getServletContext().getRealPath("");
		try {
			String picSrc = path + video.getPsrc();
			String videoSrc = path + video.getVsrc();
			File file1 = new File(picSrc);
			if (file1.exists()) {
				//System.out.println(picSrc);
				file1.delete();
			}
			
			File file2 = new File(videoSrc);
			if (file2.exists()) {
				//System.out.println(videoSrc);
				file2.delete();
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		videodao.delete(video);
		return true;
	}
	
	/**
	 * 根据类别查VIDEO
	 * */
	public List<Video> listByTypeID(int typeid){
		return videodao.listByTypeid(typeid);
	}
	
	/**
	 * 列出部分视频
	 * return list集合
	 * */
	public List<Video> listVideo(int i){
		return videodao.listVideo(i);
	}
	
	/**
	 * 根据video名字查询video
	 * */
	public Video findByName(String s){
		return videodao.findByName(s);
	}
	
	/**
	 * 查询点击排行
	 * */
	public List<Video> listVideoByClick(int i){
		return videodao.listByClick(i);
	}
	
	/**
	 * 查询下载排行
	 * */
	
	public List<Video> listVideoByDownload(int i){
		return videodao.listByDownload(i);
	}
	
	public PageBean queryForPage(int pageSize, int page,String sort,String condition) {

		final String hql = "from Video v "+condition+" order by v.uptime "+sort;// 查询语句
		int allRow = pagedao.getAllRowCount(hql);// 总记录数
		System.out.println(allRow);
		int totalPage = PageBean.countTotalPage(pageSize, allRow);// 总页数
		final int offset = PageBean.countOffset(pageSize, page);// 当前页开始记录
		final int length = pageSize;// 每页记录数
		final int currentPage = PageBean.countCurrentPage(page);
		List<Video> list = pagedao.queryForPage(Video.class,hql, offset, length);// "一页"的记录

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
