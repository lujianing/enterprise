package com.qianyan.action;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;
import com.qianyan.bean.PageBean;
import com.qianyan.entity.CompanyInfo;
import com.qianyan.entity.News;
import com.qianyan.entity.Video;
import com.qianyan.service.CompanyService;
import com.qianyan.service.NewsService;
import com.qianyan.utils.DateTime;

/**
 * 
 * 自动注入 author：鲁家宁
 * */
public class CompanyAction extends ActionSupport implements ServletResponseAware,
		ServletRequestAware {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private int id;	
	private String content;	
	private CompanyService companyservice;
	private String message;
	
	
	

	public CompanyService getCompanyservice() {
		return companyservice;
	}

	@Resource(name="companyservice")
	public void setCompanyservice(CompanyService companyservice) {
		this.companyservice = companyservice;
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

	

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public void info(){
		
		getcompanyinfo();
		
	}

	public String addcompanyinfo() {
		
		return "addcompanyinfo";
	}
	
	public String add(){
		CompanyInfo companyinfo = new CompanyInfo();
//		companyinfo.setId(id);
		companyinfo.setContent(content);
		
		companyservice.addInfo(companyinfo);
		
		return "addnewsSucc";
	}
	
	public String updateinput(){
		CompanyInfo companyinfo = companyservice.getByID(1);
		request.setAttribute("companyinfo", companyinfo);
		return "compupdateinput";
	}
	
	public String update(){
		CompanyInfo companyinfo = companyservice.getByID(id);
		if (companyinfo == null) {
			message = "未找到";
			return "error";
		}
		companyinfo.setContent(content);
		if (!companyservice.updateCompanyInfo(companyinfo)) {
			message = "更新失败";
			return "error";
		}
		message = "视频更新成功";
		return "compupdatesuccess";
	}
	
	public String delete(){
		if(!companyservice.deleteByID(id)){
			message = "删除失败";
			return "error";
		}
		return "deleteSucc";
	}
	
	
	
	public String getcompanyinfo(){
		CompanyInfo companyinfo = companyservice.getByID(1);
		request.setAttribute("companyinfo", companyinfo);
		return "getcompanyinfo";
	}
	
	
	
	
	public String demo(){
		return "demo";
	}
	
}
