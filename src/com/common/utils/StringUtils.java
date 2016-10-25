package com.common.utils;

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
	
}
