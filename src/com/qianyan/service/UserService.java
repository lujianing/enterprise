package com.qianyan.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.qianyan.bean.PageBean;
import com.qianyan.dao.PageDao;
import com.qianyan.dao.UserDao;
import com.qianyan.entity.News;
import com.qianyan.entity.User;
@Component("userservice")
public class UserService {
	private UserDao userdao;
	private PageDao pagedao;
	
	
	public UserDao getUserdao() {
		return userdao;
	}
	
	@Resource(name="userDao")
	public void setUserdao(UserDao userdao) {
		this.userdao = userdao;
	}
	public PageDao getPagedao() {
		return pagedao;
	}
	@Resource(name="pageDao")
	public void setPagedao(PageDao pagedao) {
		this.pagedao = pagedao;
	}
	
	public void save(User user){
		userdao.save(user);
	}
	
	public boolean deleteById(int id){
		User user = getByID(id);
		if(user ==null)
			return false;
		userdao.delete(user);
		return true;
	}
	
	public boolean update(User user){
		userdao.update(user);
		return true;
	}
	
	public User getByID(int id){
		return userdao.findById(User.class, id);
		
	}
	
	public List<User> listall(){
		return userdao.findAll(User.class);
	}
	
	public List<String> listallmail(){
		return userdao.listAllEmail();
	}
	
	public User findByUsername(String username){
		User u = userdao.getByName(username);
		return u;
	}
	
	public PageBean queryForPage(int pageSize, int page,String sort) {

		final String hql = "from User order by regtime "+sort;// 查询语句
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
	
	public User getByName(String name){
		return userdao.getByName(name);
	}
}
