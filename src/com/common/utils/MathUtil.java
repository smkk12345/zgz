package com.common.utils;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

public class MathUtil {
	/**
	 * lxb create
	 */
    public static final String DESC = "DESC";//降序
    public static final String ASC = "ASC";//升序
    public static final DecimalFormat df0 = new DecimalFormat("#.0"); //一位小数
    public static final DecimalFormat df1 = new DecimalFormat("#.00"); //两位小数
    
	public static Double getMaxValue(List list){
		Double result=0.0;
		list = MathUtil.sort(list,MathUtil.DESC);
		return (Double)list.get(0);
	}
	public static Double getMinValue(List list){
		list = MathUtil.sort(list,MathUtil.ASC);
		return (Double)list.get(0);
	}
	public static Double getAgeValue(List list){
		Double sum = 0.0;
		if(null==list||list.size()==0){
			return sum;
		}
		for (int i = 0; i < list.size(); i++) {
			sum  =sum+ (Double)list.get(i);
		}
		Double tem = sum/list.size();
		return MathUtil.getFormatData(tem, 1);
	}
	
	public static List sort(List list,String type){
		Double tem;
		for (int i = 0; i < list.size(); i++) {
			for (int j = i+1; j < list.size(); j++) {
				Double di = (Double)list.get(i);
				Double dj = (Double)list.get(j);
				if(type == MathUtil.DESC){
					if(di<dj){
						tem = dj;
						list.set(j, di);
						list.set(i, tem);
					}
				}
				else{
					if(di>dj){
						tem = dj;
						list.set(j, di);
						list.set(i, tem);
					}
				}
			}
		}
		return list;
	}
	/**
	 * 求方差
	 * @return  需要传递一个平均值和一个列表
	 */
	public static Double getVariance(List<Double> list,Double avg){
		Double tem = 0.00;
		if(list.size()<=0){
			return tem;
		}
		Double sum=0.00;
		for (int i = 0; i < list.size(); i++) {
			Double curValue = list.get(i);
			sum = sum + (curValue-avg)*(curValue-avg);
		}
		tem = sum/list.size();
		return MathUtil.getFormatData(tem, 1);
	}
	/**
	 * 保留两位小数
	 * @param f
	 * @param digit
	 * @return
	 */
	public static Double getFormatData(Double f, int digit) {
		try {
			BigDecimal bg = new BigDecimal(f);
			Double f1 = bg.setScale(digit, BigDecimal.ROUND_HALF_UP).doubleValue();
			return f1;
		} catch (Exception e) {
			return 0.00;
		}
	}
	
	/**
	 * 求极差
	 */
	public static Double getRangeData(List<Double> list){
		Double tem = 0.00;
		if(list.size()<2){
			return tem;
		}
		List<Double> temList = sort(list, ASC);
		tem = temList.get(temList.size()-1)-temList.get(0);
		return tem;
	}
}
