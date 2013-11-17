package com.qianyan.utils;

public class StringUtils {
	public static String substr(String str, int length, String suffix) {
		if (str == null || str.length() == 0 || length < 1) {
			return str;
		}
		if (suffix == null) {
			suffix = "";
		}
		if (suffix.length() > 0 && length > suffix.length()) {
			length = length - suffix.length();
		} else {
			suffix = "";
		}

		int lencounter = 0;
		int index = 0;
		char[] strarray = str.toCharArray();
		try {
			for (; index < strarray.length; index++) {
				char ch = strarray[index];
				int step = 1;
				if (String.valueOf(ch).getBytes("GBK").length > 1) {
					step = 2;
				}
				if ((lencounter = lencounter + step) > length) {
					index--;
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (index > 0 && index < str.length()) {
			str = str.substring(0, index) + suffix;
		}

		return str;
	}
}
