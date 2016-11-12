package com.hibernate.utils;

import com.common.utils.StringUtils;

public class SortUtils {
	
	
	/**
	 * 通过特定规则获取排序号
	 */
	
	public static String getSubSortStr(String parentSortStr,int subCount){
		String resultStr =	parentSortStr;
		if(subCount == 0){
			resultStr = parentSortStr+"-"+1;
		}else{
			subCount = subCount;
			resultStr = parentSortStr+"-"+subCount;
		}
		return resultStr;
	}
	
	private static int[] pArr = {10000,1000,10,1};
	
	/**
	 * 1-1
	 * 1-1-1
	 * 1-1-2
	 * 1-2
	 * 1-1-2-1
	 * 2-1-1
	 * 1-20-1
	 * @param sort
	 * @return
	 */
	public static int getSortNum(String sort){
		int nSort = 0;
		if(StringUtils.isBlank(sort)){
			return 0;
		}
		String[] arr=  sort.split("-");
		if(arr.length>4)return 0;
		
		for (int i = 0; i < arr.length; i++) {
			String str = arr[i];
			if(str.indexOf("~")>0){
				str = str.split("~")[0];
			}
			nSort += Integer.parseInt(str)*pArr[i];
		}
		return nSort;
	}
	
}
