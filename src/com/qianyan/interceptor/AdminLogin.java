package com.qianyan.interceptor;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.qianyan.entity.User;

public class AdminLogin implements Interceptor {

	
	public void destroy() {
		// TODO Auto-generated method stub

	}

	
	public void init() {
		// TODO Auto-generated method stub

	}

	
	public String intercept(ActionInvocation ai) throws Exception {
		String url = ServletActionContext.getRequest().getServletPath();
	
//		System.out.println(url);
		if (!url.equals("/Admin_logincheck")) {
			User user = (User) ai.getInvocationContext().getSession().get("admin");
			if (user == null) {
				ServletActionContext.getResponse().sendRedirect("admin");
				//return "adminlogin";
			}
		}
		    
		return ai.invoke();
	}

}
