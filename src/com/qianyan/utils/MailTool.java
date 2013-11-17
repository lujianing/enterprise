package com.qianyan.utils;



import java.security.*;
import java.text.DateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

public class MailTool {

	
	public static void sendMail(String email,String subject,String msg) {
		SimpleEmail semail = new SimpleEmail();
		String fromMail = "lujianing121128@163.com";
		String password = "3238761";
		//设置邮件的地址
		semail.setHostName("smtp.163.com");
		semail.setAuthentication(fromMail,password );
		semail.setCharset("utf-8");
		try {
			semail.setFrom(fromMail);
			semail.addTo(""+email);
			semail.setSubject(subject);
			semail.setMsg(msg);
			semail.send();
			
		} catch (EmailException e) {
			e.printStackTrace();
			
		}
	}

	

}
