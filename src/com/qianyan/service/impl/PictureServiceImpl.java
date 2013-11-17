package com.qianyan.service.impl;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.qianyan.bean.PageBean;
import com.qianyan.dao.PageDao;
import com.qianyan.dao.PictureDao;
import com.qianyan.entity.News;
import com.qianyan.entity.Picture;
import com.qianyan.service.PictureService;

@Component("pictureservice")
public class PictureServiceImpl extends BaseServiceImpl<Picture, Integer> implements
		PictureService {
	private PictureDao picturedao;
	private PageDao pagedao;
	
	public PictureDao getPrcturedao() {
		return picturedao;
	}
	@Resource(name="pictureDao")
	public void setPrcturedao(PictureDao picturedao) {
		this.picturedao = picturedao;
	}

	public PageDao getPagedao() {
		return pagedao;
	}
	
	@Resource(name="pageDao")
	public void setPagedao(PageDao pagedao) {
		this.pagedao = pagedao;
	}

	
	
	
	public void save(Picture entity) {
		System.out.println("保存图片");
		picturedao.save(entity);

	}

	
	public void delete(Picture entity) {
		String realadd = ServletActionContext.getRequest().getRealPath("/"+entity.getSrc());
		String smalladd = ServletActionContext.getRequest().getRealPath("/"+entity.getSmallsrc());
		File file1 = new File(realadd);
		if (file1.exists()) {
			file1.delete();
		}
		File file2 = new File(smalladd);
		if(file2.exists()){
			file2.delete();
		}
		picturedao.delete(entity);

	}

	
	public void deleteById(Class<Picture> entityClass, Integer id) {
		Picture entity = findById(entityClass, id);
		String realadd = ServletActionContext.getRequest().getRealPath("/"+entity.getSrc());
		String smalladd = ServletActionContext.getRequest().getRealPath("/"+entity.getSmallsrc());
		File file1 = new File(realadd);
		if (file1.exists()) {
			file1.delete();
		}
		File file2 = new File(smalladd);
		if(file2.exists()){
			file2.delete();
		}
		picturedao.deleteById(entityClass, id);

	}

	
	public void update(Picture entity) {
		picturedao.update(entity);

	}

	
	public Picture findById(Class<Picture> entityClass, Integer id) {
		
		return picturedao.findById(entityClass, id);
	}

	
	public List<Picture> findAll(Class<Picture> entityClass) {
		
		return picturedao.findAll(entityClass);
	}
	
	public PageBean queryForPage(int pageSize, int page,String sort) {

		final String hql = "from Picture order by uptime "+sort;// 查询语句
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
	
	public List<Picture> listbynum(int num, String sort) {
		return picturedao.listbynum(num, sort);
	}

}
