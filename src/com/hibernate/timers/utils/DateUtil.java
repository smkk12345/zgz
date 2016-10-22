package com.hibernate.timers.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
private static SimpleDateFormat sf;
	
	/**
	 * 根据格式获得当前日期的String值
	 * @param format
	 * @return
	 */
	public static String getStringDateByType(String format) {
		String dateFormat = null;
		try {
			sf = new SimpleDateFormat(format);
			dateFormat = sf.format(new Date());
		}catch (Exception e) {
			e.printStackTrace();
			return dateFormat;
		}
		return dateFormat;
	}
	/**
	 * 根据格式和需要跳跃的数据获得当日前后几日的日期
	 * @param format 格式
	 * @param toNum 跳跃的数字
	 * @return
	 */
	public static String getStringDateByType(String format,int toNum) {
		String dateFormat = null;
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.DATE, toNum);
		try {
			sf = new SimpleDateFormat(format);
			dateFormat = sf.format(cal.getTime());
		}catch (Exception e) {
			e.printStackTrace();
			return dateFormat;
		}
		return dateFormat;
	}
	/**
	 *  根据格式、日期获得日期的String值
	 * @param format
	 * @param date
	 * @return
	 */
	public static String getStringDateByType(String format,Date date) {
		String dateFormat = null;
		try {
			sf = new SimpleDateFormat(format);
			dateFormat = sf.format(date);
		}catch (Exception e) {
			e.printStackTrace();
			return dateFormat;
		}
		return dateFormat;
	}
	public static void main(String[] args) {
		System.out.println(getStringDateByType("dd",new Date()));
	}
}
