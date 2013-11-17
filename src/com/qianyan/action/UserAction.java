package com.qianyan.action;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;
import com.qianyan.entity.User;
import com.qianyan.service.UserService;
import com.qianyan.utils.DateTime;
import com.qianyan.utils.Encrypt;
import com.qianyan.utils.MailCodeRan;
import com.qianyan.utils.MailTool;

public class UserAction extends ActionSupport implements ServletRequestAware,
		ServletResponseAware {
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	private int id;
	private String name;
	private String password;
	private String repassword;
	private String sex;
	private String email;
	private int power;
	private String message;
	private String activecode; //激活码
	private int activetype; //0未激活 1激活
	
	private UserService userservice;
	
	
	public UserService getUserservice() {
		return userservice;
	}
	
	@Resource(name="userservice")
	public void setUserservice(UserService userservice) {
		this.userservice = userservice;
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

	
	
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPower() {
		return power;
	}

	public void setPower(int power) {
		this.power = power;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getActivecode() {
		return activecode;
	}

	public void setActivecode(String activecode) {
		this.activecode = activecode;
	}

	public int getActivetype() {
		return activetype;
	}

	public void setActivetype(int activetype) {
		this.activetype = activetype;
	}

	public String register(){
		return "register";
	}
	
	public String save(){
		if(name==null){
			message="用户名不能为空";
			return "error";
		}
		if(!password.equals(repassword)){
			System.out.println(password);
			System.out.println(repassword);
			message="两次密码不一致";
			return "error";
		}
		if(userservice.getByName(name) !=null){
			message="用户已被注册";
			return "error";
		}
		User user = new User();
		user.setName(name);
		user.setPassword(Encrypt.encode(password));
		user.setSex(sex);
		user.setEmail(email);
		user.setPower(0);
		user.setRegtime(DateTime.getDateTime());
		user.setActivecode(MailCodeRan.getEmailCode());
		userservice.save(user);
		
		
		StringBuffer body=new StringBuffer();
		StringBuffer link=new StringBuffer();
		String path = request.getContextPath(); 
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		body.append("您在XX网站注册的用户名是：");
		body.append(user.getName());
		body.append(",请点击以下链接激活帐号！激活邮箱后将获得公司的信息动态!\n");
		link.append(basePath);
		link.append("User_activetype?name=");
		link.append(user.getName());
		link.append("&activecode=");
		link.append(user.getActivecode());
		body.append(link.toString());
		MailTool.sendMail(email,"欢迎加入XX网","感谢您的注册 "+body.toString());
		
		message = "注册成功";
		return "usersaveSucc";
	}
	
	public String activetype(){
		System.out.println("aaa");
		if(name==null){
			message="用户名不能为空";
			return "error";
		}
		
		User user = userservice.getByName(name);
		if(user ==null){
			message="用户不存在";
			return "error";
		}
	
		if(!user.getActivecode().equals(activecode)){
			message="验证码错误";
			return "error";
		}
		user.setActivetype(1) ; //激活
		boolean succ =userservice.update(user);
		if(succ==false){
			message = "激活失败";
			return "error";
		}
		
		message = "激活成功";
		return "uservaliSucc";
	}

	public String test(){
		//System.out.println(request.getRealPath("/image/")+"image.jpg");
		//System.out.println(request.getSession().getServletContext());
		//System.out.println(request.getSession().getServletContext().getRealPath(""));
		//System.out.println(request.getSession().getServletContext().getRealPath("/"));
		//System.out.println(request.getSession().getServletContext().getRealPath("image"));
		//System.out.println(request.getSession().getServletContext().getRealPath("/iamge"));
		//System.out.println(request.getSession().getServletContext().getRealPath("image/"));
		//System.out.println(request.getSession().getServletContext().getRealPath("/iamge/"));
		System.out.println(request.getSession().getServletContext().getRealPath("/image/")+"image.jpg");
		System.out.println(request.getSession().getServletContext().getRealPath("/image")+"image.jpg");
		System.out.println(request.getRealPath("/image/")+"image.jpg");
		System.out.println(request.getRealPath("/image")+"image.jpg");
		System.out.println(request.getRealPath("image")+"image.jpg");
		System.out.println(request.getRealPath("image/")+"image.jpg");
		//System.out.println(request.getSession().getServletContext().getRealPath("image")+"/"+"image.jpg");
		//System.out.println(request.getSession().getServletContext().getRealPath(File.separator)+"image.jpg");
		return "error";
	}

		

}
