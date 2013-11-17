package com.qianyan.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.qianyan.entity.User;
import com.qianyan.service.UserService;


public class ValidateAction extends ActionSupport {
	
	private UserService userservice;
	private String msg;
	private List<String> jsonValidateReturn=new ArrayList<String>();
	
	@JSON(serialize=false) 
	public UserService getUserservice() {
		return userservice;
	}
	
	
	@Resource(name="userService")
	public void setUserservice(UserService userservice) {
		this.userservice = userservice;
	}
	public String vali() {
		ActionContext ac = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ac
		.get(ServletActionContext.HTTP_REQUEST);
		String validateId = request.getParameter("validateId");
		
		

		String validateValue = request.getParameter("validateValue");
		String validateError = request.getParameter("validateError");
	
		jsonValidateReturn.add(validateId);
		jsonValidateReturn.add(validateError);
	//	System.out.println("开始验证啦"+validateId+" : "+validateValue+":"+validateError);
		
		
		User user =userservice.findByUsername(validateValue);
		 //		System.out.println(user.getUsername());
		
		/**
		 * 假验证  @Resource(name="userService") 
		 * spring一注入service
		 * 前台的ajax验证就刷新不出来结果
		 * */
		if(user!=null){
			if(validateValue.equals(user.getName()))
				jsonValidateReturn.add("false");
			else
				jsonValidateReturn.add("true");
		}else{
			jsonValidateReturn.add("true");
		}
		return SUCCESS;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	public List<String> getJsonValidateReturn() {
		return jsonValidateReturn;
	}
	public void setJsonValidateReturn(List<String> jsonValidateReturn) {
		this.jsonValidateReturn = jsonValidateReturn;
	}
	

}
