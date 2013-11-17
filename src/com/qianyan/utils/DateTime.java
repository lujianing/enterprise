package com.qianyan.utils;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTime {
	public static String getDateTime(){
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//将时间格式转换成符合Timestamp要求的格式.
		String timestr = sdf.format(date);
		
		return timestr;
	}
}
