package com.qianyan.action;

import java.util.ArrayList;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.qianyan.entity.News;
import com.qianyan.entity.User;
import com.qianyan.service.NewsService;
import com.qianyan.service.UserService;
import com.qianyan.utils.DateTime;

public class MainAction extends ActionSupport implements ServletRequestAware,
		ServletResponseAware {
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	private String message;
	
	private NewsService newsservice;
	private String language;
	


	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public NewsService getNewsservice() {
		return newsservice;
	}

	@Resource(name = "newsservice")
	public void setNewsservice(NewsService newsservice) {
		this.newsservice = newsservice;
	}
	
	
	

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;

	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	
	
	public String register(){
		return "register";
	}
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	
	public String mainpage(){
		ArrayList<News> lists = (ArrayList<News>) newsservice.listNews(4);
		request.setAttribute("lists", lists);
		return "mainpage";
	}
	
	public String changlocal(){
		Locale locale = null;
		if(language.equals("en"))
			locale =new Locale("en","US");
		else
			locale =new Locale("zh","CN");
		ActionContext.getContext().getSession().put("WW_TRANS_I18N_LOCALE", locale);
		ArrayList<News> lists = (ArrayList<News>) newsservice.listNews(4);
		request.setAttribute("lists", lists);
		return "changlocal";
	}
	

}
