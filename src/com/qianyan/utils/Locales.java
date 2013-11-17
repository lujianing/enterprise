package com.qianyan.utils;

import java.util.Hashtable;
import java.util.Locale;
import java.util.Map;



public class Locales {
	private Locale current;

	public Locale getCurrent() {
		return current;
	}

	public void setCurrent(Locale current) {
		this.current = current;
	}
	
	public Map<String,Locale> getLocales(){
		Map<String,Locale> locales =new Hashtable<String,Locale>(2);
		locales.put("Chinese",Locale.CHINA);
		locales.put("English",Locale.US);
		return locales;
	}
	
}
