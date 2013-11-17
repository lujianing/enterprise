package com.qianyan.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;
import com.qianyan.bean.PageBean;
import com.qianyan.entity.News;
import com.qianyan.entity.User;
import com.qianyan.entity.Video;
import com.qianyan.service.NewsService;
import com.qianyan.service.UserService;
import com.qianyan.utils.DateTime;
import com.qianyan.utils.MailTool;

/**
 * 
 * 自动注入 author：鲁家宁
 * */
public class NewsAction extends ActionSupport implements ServletResponseAware,
		ServletRequestAware {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private int id;
	private String title;
	private String content;
	private String uptime;
	private String newstype;
	private NewsService newsservice;
	private String message;
	private int page; //分页第几页
	private int sendmail;
	
	public NewsService getNewsservice() {
		return newsservice;
	}

	@Resource(name = "newsservice")
	public void setNewsservice(NewsService newsservice) {
		this.newsservice = newsservice;
	}
	
	private UserService userservice;
	
	
	public UserService getUserservice() {
		return userservice;
	}
	
	@Resource(name="userservice")
	public void setUserservice(UserService userservice) {
		this.userservice = userservice;
	}

	/* 自动注入 */
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	/* 自动注入 */
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUptime() {
		return uptime;
	}

	public void setUptime(String uptime) {
		this.uptime = uptime;
	}

	public String getNewstype() {
		return newstype;
	}

	public void setNewstype(String newstype) {
		this.newstype = newstype;
	}
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String addnews() {
		return "addnews";
	}
	
	public String add(){
		News news = new News();
		news.setId(id);
		news.setTitle(title);
		news.setContent(content);
		news.setUptime(DateTime.getDateTime());
		newsservice.addNews(news);
		message="添加新闻成功！";
		if(sendmail>0){
			List<String> mails =userservice.listallmail();
			for(int i=0 ; i<mails.size(); i++){
				MailTool.sendMail(mails.get(i),title,content.replace("<p>", "").replace("</p>", ""));
			}
		}
		
		return "addnewsSucc";
	}
	
	public void delete() throws IOException{
		if(!newsservice.deleteByID(id)){
			message = "删除新闻失败";
//			return "error";
		}
		response.getWriter().print("{\"del\":\"true\"}");
//		return "deleteSucc";
	}
	
	public String listnews(){
		
		ArrayList<News> listclick = (ArrayList<News>) newsservice
				.listVideoByClick(10);
		request.setAttribute("listclick", listclick);
		
		PageBean pagebean = newsservice.queryForPage(10, page, "desc");
		request.setAttribute("pagebean", pagebean);
		return  "listnews";
	}
	
	public String getnews(){
		News news = newsservice.getNewsByID(id);
		request.setAttribute("news", news);
		
		ArrayList<News> listclick = (ArrayList<News>) newsservice
				.listVideoByClick(10);
		request.setAttribute("listclick", listclick);
		return "getnews";
	}
	
	public String mainpage(){
		ArrayList<News> lists = (ArrayList<News>) newsservice.listNews(8);
		request.setAttribute("lists", lists);
		return "mainpage";
	}
	
	
	public String demo(){
		return "demo";
	}

	public int getSendmail() {
		return sendmail;
	}

	public void setSendmail(int sendmail) {
		this.sendmail = sendmail;
	}
	
}
