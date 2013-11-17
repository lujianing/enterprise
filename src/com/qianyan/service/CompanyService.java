package com.qianyan.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.qianyan.bean.PageBean;
import com.qianyan.dao.CompanyDao;
import com.qianyan.entity.CompanyInfo;
import com.qianyan.entity.News;
import com.sun.nio.sctp.MessageInfo;


/**
 * service 是业务逻辑层 
 * 次层负责一系列的业务逻辑
 * 比如删除照片删除数据库信息  删除文件信息等
 * author：鲁家宁
 * */
@Component("companyservice")
public class CompanyService {
	
	private CompanyDao companydao;
	public CompanyDao getCompanydao() {
		return companydao;
	}
		
	@Resource(name="companyDao")
	public void setCompanydao(CompanyDao companydao) {
		this.companydao = companydao;
	}

	
	
	

	public void addInfo(CompanyInfo companyinfo){
		companydao.save(companyinfo);
	}
	
	/**
	 * 更新视频
	 *return true代表成功 false代表失败
	 * */
	public boolean updateCompanyInfo(CompanyInfo companyinfo){
		companydao.update(companyinfo);
		 return true;
	}
	
	public CompanyInfo getByID(int id){
		CompanyInfo companyinfo =companydao.findById(CompanyInfo.class, id);
		
		return companyinfo;
	}
	
	/**
	 * 列出全部的视频
	 * return list集合
	 * */
	/*public List<News> listNews(){
		return newsdao.findAll(News.class);
	}*/
	
	/**
	 * 删除视频
	 * return true代表删除成功 false代表删除失败
	 * */
	
	public boolean deleteByID(int id){
		CompanyInfo companyinfo = getByID(id);
		if(companyinfo==null)
			return false;
		
		companydao.delete(companyinfo);
		return true;
	}
	
	
	
	
	
	
	
	
	
	
}
