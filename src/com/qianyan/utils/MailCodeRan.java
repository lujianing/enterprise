/**
 * 
 */
package com.qianyan.utils;

import java.util.Random;

/**
 * @author Administrator
 *
 */
public class MailCodeRan {
	private static  Random random = null;
	static{
		random=new Random();	
	}
	
	public MailCodeRan(){		
	}
	
	public static String getEmailCode(){
		long rnd = random.nextLong();		
		return Long.toHexString(rnd);                  //以十六进制无符号整数形式返回 long 参数的字符串表示形式
	}
}
