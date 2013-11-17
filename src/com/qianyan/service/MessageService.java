package com.qianyan.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.qianyan.bean.PageBean;
import com.qianyan.dao.CompanyDao;
import com.qianyan.dao.MessageDao;
import com.qianyan.dao.PageDao;
import com.qianyan.entity.CompanyInfo;
import com.qianyan.entity.Message;
import com.qianyan.entity.News;
import com.sun.nio.sctp.MessageInfo;


/**
 * service 是业务逻辑层 
 * 次层负责一系列的业务逻辑
 * 比如删除照片删除数据库信息  删除文件信息等
 * author：鲁家宁
 * */
@Component("messageservice")
public class MessageService {
	
	

	private MessageDao messagedao;
	private PageDao pagedao;
	public PageDao getPagedao() {
		return pagedao;
	}
	@Resource(name="pageDao")
	public void setPagedao(PageDao pagedao) {
		this.pagedao = pagedao;
	}
	
	public MessageDao getMessagedao() {
		return messagedao;
	}
		
	@Resource(name="messageDao")
	public void setMessagedao(MessageDao messagedao) {
		this.messagedao = messagedao;
	}
	

	public void addInfo(Message message){
		messagedao.save(message);
	}
	
	/**
	 * 更新视频
	 *return true代表成功 false代表失败
	 * */
	public boolean update(Message message){
		messagedao.update(message);
		 return true;
	}
	
	public Message getByID(int id){
		Message message =messagedao.findById(Message.class, id);
		
		return message;
	}
	
	/**
	 * 列出全部的视频
	 * return list集合
	 * */
	public List<Message> listALL(){
		return messagedao.findAll(Message.class);
	}
	
	/**
	 * 删除视频
	 * return true代表删除成功 false代表删除失败
	 * */
	
	public boolean deleteByID(int id){
		Message message = getByID(id);
		if(message==null)
			return false;
		
		messagedao.delete(message);
		return true;
	}
	
	
	public PageBean queryForPage(int pageSize, int page,String sort) {

		final String hql = "from Message  order by uptime "+sort;// 查询语句
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
