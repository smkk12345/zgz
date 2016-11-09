package com.hibernate.utils;

import com.common.utils.StringUtils;

public class SortUtils {
	
	
	/**
	 * 通过特定规则获取排序号
	 */
	
	public String getSubSortStr(String parentSortStr,int subCount){
		String resultStr =	parentSortStr;
		if(subCount == 0){
			resultStr = parentSortStr+"-"+1;
		}else{
			resultStr = parentSortStr+"-"+subCount+1;
		}
		return resultStr;
	}
	
	int[] pArr = {10000,1000,10,1};
	
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
	public int getSortNum(String sort){
		int nSort = 0;
		if(StringUtils.isBlank(sort)){
			return 0;
		}
		String[] arr=  sort.split("-");
		if(arr.length>4)return 0;
		
		for (int i = 0; i < arr.length; i++) {
			nSort += Integer.parseInt(arr[i])*pArr[i];
		}
		return nSort;
	}
	
}
