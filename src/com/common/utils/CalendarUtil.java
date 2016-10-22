package com.common.utils;

import static java.util.Calendar.DATE;
import static java.util.Calendar.DAY_OF_MONTH;
import static java.util.Calendar.DAY_OF_WEEK;
import static java.util.Calendar.DAY_OF_YEAR;
import static java.util.Calendar.HOUR_OF_DAY;
import static java.util.Calendar.MILLISECOND;
import static java.util.Calendar.MINUTE;
import static java.util.Calendar.MONTH;
import static java.util.Calendar.SECOND;
import static java.util.Calendar.YEAR;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * <p>CalendarUtil</p>
 * <p>���ڹ�����</p>
 * @author lxb
 * @version 0.0.0
 */
public class CalendarUtil {
    /** ���ڸ�ʽ yyyy-MM-dd */
    public static final String DATE_FORMAT_MODE1 = "yyyy-MM-dd";
    /** ���ڸ�ʽ yyyy-MM-dd HH24:mi */
    public static final String DATE_FORMAT_MODE3 = "yyyy-MM-dd HH24:mi";
    /** ���ڸ�ʽ yyyy-MM-dd HH:mm */
    public static final String DATE_FORMAT_MODE2 = "yyyy-MM-dd HH:mm";
    /** ���ڸ�ʽyyyy-MM-dd HH:mm:ss */						
    public static final String DATE_FORMAT_MODE4 = "yyyy-MM-dd HH:mm:ss";
    /** ���ڸ�ʽ yyyyMMdd */
    public static final String DATE_FORMAT_MODE5 = "yyyyMMdd";    
    
    /**
     * ��ȡ��ǰ���� 
     * @param format �����ַ�Ԥת���ĸ�ʽ
     * @return ��ǰ����
     */
    public static String getCurrentDate(String format){
		Calendar calendar = Calendar.getInstance();
		return formatStr(calendar, format);
    }    
    
    /**
     * Date����ת��ΪCalendar���� 
     * @param sourceDate Date��������
     * @return Calendar��������
     */
    public static Calendar formatCalendar(Date sourceDate){
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(sourceDate);
		return calendar;
    }
    
    /**
     * �ַ�ת��ΪCalendar�������� 
     * @param source �����ַ�
     * @param format �����ַ�����и�ʽ
     * @return ����
     * @throws ParseException �쳣
     */
    public static Calendar formatCalendar(String source, String format) throws ParseException{
		Date date = formatDate(source, format);
		ArrayList<String> a = new ArrayList<String>();
		
		return formatCalendar(date);
    }    
        
    /**
     * ����ת��Ϊ�ַ� 
     * @param date Date����
     * @param format ����Ԥת�����ַ��ʽ
     * @return format��ʽ�������ַ�
     */
    public static String formatStr(Date date, String format) {
    	return new SimpleDateFormat(format).format(date);
    }    
    
    /**
     * ����ת��Ϊ�ַ�
     * @param date Calendar����
     * @param format ����Ԥת�����ַ��ʽ
     * @return format��ʽ�������ַ�
     */
    public static String formatStr(Calendar date, String format) {
    	return formatStr(date.getTime(), format);
    }    
    
    /**
     * �ַ��ʽת�� 
     * @param source �����ַ�
     * @param sourceFormat �����ַ�����и�ʽ
     * @param targetFormat �����ַ�Ԥת���ĸ�ʽ
     * @return targetFormat ��ʽ���ַ�
     * @throws ParseException �쳣
     */
    public static String formatStr(String source, String sourceFormat, String targetFormat) throws ParseException{
		Date date = formatDate(source, sourceFormat);	
		return formatStr(date, targetFormat);
    }

    /**
     * �ַ�ת��ΪDate�������� 
     * @param date �����ַ�
     * @param format �����ַ�����и�ʽ
     * @return ����
     * @throws ParseException �쳣
     */
    public static Date formatDate(String date, String format) throws ParseException {
    	return new SimpleDateFormat(format).parse(date);
    }        
    
    /**
     * ��ȡ�µ�����  
     * @param d ����
     * @param n �������
     * @param type ��������(�գ�Calendar.DAY_OF_MONTH��Сʱ��HOUR_OF_DAY�����ӣ�MINUTE���룺SECOND�����룺MILLISECOND)
     * @return Date
     */
    public static Date getNextDate(Date d, int n, int type){
		Calendar calendar = formatCalendar(d);
		calendar.add(type, n);
		return calendar.getTime();
    }
    
    /**
     * ��ȡ�µ����� 
     * @param date ����
     * @param format �ַ��ʽ
     * @param n �������
     * @param type ��������(�գ�DAY_OF_MONTH��Сʱ��HOUR_OF_DAY�����ӣ�MINUTE���룺SECOND�����룺MILLISECOND)
     * @return Date
     * @throws ParseException
     */
    public static Date getNextDate(String date, String format, int n, int type) throws ParseException{
		Calendar calendar = formatCalendar(date, format);
		calendar.add(type, n);
		return calendar.getTime();
    }    
    
    /**
     * ��ȡ���ܵ�ָ������ 
     * @param calendar ��ǰ����
     * @param n ��0~7 ���������������գ�
     * @return �µ�����
     */
    public static Calendar getWeekByNumber(Calendar calendar, int n){
		switch(n){
		    case 0: calendar.set(DAY_OF_WEEK, n+1); break;
		    case 1: calendar.set(DAY_OF_WEEK, n+1); break;
		    case 2: calendar.set(DAY_OF_WEEK, n+1); break;
		    case 3: calendar.set(DAY_OF_WEEK, n+1); break;
		    case 4: calendar.set(DAY_OF_WEEK, n+1); break;
		    case 5: calendar.set(DAY_OF_WEEK, n+1); break;
		    case 6: calendar.set(DAY_OF_WEEK, n+1); break;
		    case 7: 
			calendar.set(DAY_OF_WEEK, n); 
			calendar.add(DAY_OF_MONTH, 1); break;
		    default: break;
		}
		return calendar;
    }
    
    /**
     * �������� 
     * @param date ������
     * @param year
     * @param month
     * @param day
     * @param hour
     * @param minute
     * @param second
     * @param millisecond
     * @return Date ������
     */
    public static Date setSpecifiedDate(Date date, int year, int month, int day, int hour, int minute, int second, int millisecond){
		Calendar calendar = formatCalendar(date);
		if(year != -1) calendar.set(YEAR, year);
		if(month != -1) calendar.set(MONTH, month-1);
		if(day != -1) calendar.set(DATE, day);
		if(hour != -1) calendar.set(HOUR_OF_DAY, hour);
		if(minute != -1) calendar.set(MINUTE, minute);
		if(second != -1) calendar.set(SECOND, second);
		if(millisecond != -1) calendar.set(MILLISECOND, millisecond);
		return calendar.getTime();
    }
    
    /**
     * �������� 
     * @param date ������
     * @param format ���ڸ�ʽ
     * @param year
     * @param month
     * @param day
     * @param hour
     * @param minute
     * @param second
     * @param millisecond
     * @return Date ������
     * @throws ParseException
     */
    public static Date setSpecifiedDate(String date, String format, int year, int month, int day, int hour, int minute, int second, int millisecond) throws ParseException{
		Date calendar = formatDate(date, format);
		return setSpecifiedDate(calendar, year, month, day, hour, minute, second, millisecond);
    }    
    
    /**
     * ��ȡָ������ 
     * @param date ����
     * @param dateType ָ����ȡ�������ͣ�1. ���µĵ�N��; 2. ����ĵ�N��; 3. ����ĵ�N�죩
     * @param n ָ���������͵ĵ�N��
     *  �գ�1~31�����µĵ�N��
     *  �£�1~12������ĵ�N��
     *  �꣨1~365������ĵ�N��
     * @return ָ������ 
     * @throws ParseException �쳣
     */
    public static Calendar getSpecifiedDate(Date date, int dateType, int n) throws ParseException{
		Calendar calendar = formatCalendar(date);
		switch(dateType){
		    case 1: calendar.set(DAY_OF_MONTH, n); break;
		    case 2: calendar.set(MONTH, n-1); break;
		    case 3: calendar.set(DAY_OF_YEAR, n); break;
		    default: break;
		}
		return calendar;
    }
    
    /**
     * ��ȡ���ڵ�ָ���ֶ� 
     * @param date ����
     * @param fieldType �ֶ����ͣ��꣺YEAR���£�MONTH���գ�DAY_OF_MONTH��Сʱ��HOUR_OF_DAY�����ӣ�MINUTE���룺SECOND�����룺MILLISECOND��
     * @return ���ڵ�ָ���ֶ�
     */
    public static int getDayByField(Date date, int fieldType) {
		Calendar calendar = formatCalendar(date);
		switch(fieldType){
		    case MONTH: return calendar.get(MONTH) + 1;
		    default: return calendar.get(fieldType);
		}
    }
    
    /**
     * ��ȡ���ڵ�ָ���ֶ� 
     * @param date ����
     * @param sourceFormat �����ַ�����и�ʽ
     * @param fieldType �ֶ����ͣ��꣺YEAR���£�MONTH���գ�DAY_OF_MONTH��Сʱ��HOUR_OF_DAY�����ӣ�MINUTE���룺SECOND�����룺MILLISECOND��
     * @return ���ڵ�ָ���ֶ�
     * @throws ParseException �쳣
     */
    public static int getDayByField(String source, String sourceFormat, int fieldType) throws ParseException{
		Date date = formatDate(source, sourceFormat);
		return getDayByField(date, fieldType);
    }  
           
    /**
     * ��ȡ���ڲ� 
     * @param startDate ��ʼʱ��
     * @param endDate ����ʱ��
     * @param startDateFormat ��ʼʱ���ַ��ʽ
     * @param endDateFormat ����ʱ���ַ��ʽ
     * @param divisor ���ó���ض�Ӧ��ʱ����(24*60*60*1000)��Сʱ(60*60*1000)������(60 * 1000)...��
     * @return ���ڲ� 
     * @throws ParseException �쳣
     */
    public static long getDateSubtract(String startDate, String startDateFormat, String endDate, String endDateFormat, int divisor) throws ParseException{
		Date start = formatDate(startDate, startDateFormat);
		Date end = formatDate(endDate, endDateFormat);
		return getDateSubtract(start, end, divisor);
    }
    
    /**
     * ��ȡ���ڲ�
     * @param startDate ��ʼʱ��
     * @param endDate ����ʱ��
     * @param divisor ���ó���ض�Ӧ��ʱ����(24*60*60*1000)��Сʱ(60*60*1000)������(60 * 1000)...��
     * @return ���ڲ� 
     * @throws ParseException �쳣
     */
    public static long getDateSubtract(Date startDate, Date endDate, int divisor) {
    	return (endDate.getTime() - startDate.getTime()) / divisor;
    }    
            
    /**
     * ��ȡ���ڵ����ʱ��
     * @param d ����
     * @return Date �������
     */
    public static Date getDayZero(Date d){
		Calendar calendar = formatCalendar(d);
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		return calendar.getTime();
    }     
    
    /**
     * ��ȡָ��ʱ�䷶Χ�ڵ����ڼ��ϣ� ���ʱ�����������
     * @param startDate ��ʼ����
     * @param endDate ��������
     * @param interval ʱ����(��λ������)
     * @param isStart �Ƿ������ʼ����
     * @param isEnd �Ƿ������������
     * @return List<Date>
     * @throws ParseException �쳣
     */
    public static List<Date> getDateRange(Date startDate, Date endDate, int interval, boolean isStart, boolean isEnd) throws ParseException{
		List<Date> dateList = new ArrayList<Date>();
		Date nextTime = endDate;
		if(!isEnd) nextTime = getNextDate(nextTime, -interval, MINUTE);
		while(startDate.before(nextTime) ){	    
		    dateList.add(nextTime);
		    nextTime = getNextDate(nextTime, -interval, MINUTE);
		}
		if(isStart) dateList.add(startDate);
		return dateList;
    }

    public static void main(String ss[]) throws Exception{
		String format1 = "yyyy-MM-dd HH:mm:ss";
		String sDate = "2010-11-12 15:30:59";
		Date d = formatDate(sDate, format1);
		
		Date firstYear = setSpecifiedDate(d, -1, 1, 1, 0,0,0,0);
		Date lastYear = getNextDate(firstYear, 1, YEAR);
		Date firstMonth = setSpecifiedDate(d, -1, -1, 1, 0,0,0,0);
		Date lastMonth = getNextDate(firstMonth, 1, MONTH);
		Date firstDay = setSpecifiedDate(d, -1, -1, -1, 0,0,0,0);
		Date lastDay = getNextDate(firstDay, 1, DAY_OF_MONTH);	
		System.out.println("firstYear : " + formatStr(firstYear, format1));
		System.out.println("lastYear  : " + formatStr(lastYear, format1));
		System.out.println("firstMonth: " + formatStr(firstMonth, format1));
		System.out.println("lastMonth : " + formatStr(lastMonth, format1));
		System.out.println("firstDay  : " + formatStr(firstDay, format1));
		System.out.println("lastDay   : " + formatStr(lastDay, format1));	
		System.out.println("d         : " + formatStr(d, format1));
	
		System.out.println(getDayByField(new Date(), YEAR) + "-" + 
		                   getDayByField(new Date(), MONTH) + "-" + 
		                   getDayByField(new Date(), DAY_OF_MONTH) + " " + 
		                   getDayByField(new Date(), HOUR_OF_DAY) + ":" + 
		                   getDayByField(new Date(), MINUTE) + ":" + 
		                   getDayByField(new Date(), SECOND));
		
		List<Date> list = getDateRange(firstDay, lastDay, 60, true, true );
		for(Date tempDate : list){
		    System.out.println(formatStr(tempDate, format1));
		}
    }
}