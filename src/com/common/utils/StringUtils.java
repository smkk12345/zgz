package com.common.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class StringUtils extends org.apache.commons.lang.StringUtils{
	public static String trim(String target) {
		return target == null ? target : target.trim();
	}

	public static boolean isEmpty(String target) {
		return target == null || target.trim().length() == 0 ? true : false;
	}

	public static String leftPad(String string, int size, String padString) {
		return org.apache.commons.lang.StringUtils.leftPad(string, size, padString);
	}

	public static String rightPad(String string, int size, String padString) {
		return org.apache.commons.lang.StringUtils.rightPad(string, size, padString);
	}
	
	public static int IdNOToAge(String IdNO) {
		int leh = IdNO.length();
		String dates = "";
		if (leh == 18) {
			int se = Integer.valueOf(IdNO.substring(leh - 1)) % 2;
			dates = IdNO.substring(6, 10);
			SimpleDateFormat df = new SimpleDateFormat("yyyy");
			String year = df.format(new Date());
			int u = Integer.parseInt(year) - Integer.parseInt(dates);
			return u;
		} else {
			dates = IdNO.substring(6, 8);
			return Integer.parseInt(dates);
		}

	}

}
