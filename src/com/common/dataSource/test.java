package com.common.dataSource;

import java.net.URL;

public class test {
	/** 
	 * @名称: main 
	 * @日期：2015-11-22 上午11:33:53
	 * @作者： lxb
	 * @描述: TODO 
	 * @参数 @param args    
	 * @返回值 void    
	 * @异常 
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		URL path = Thread.currentThread().getContextClassLoader().getResource("");
		String pathStr = path.getPath();
		String[] pathStrArr = pathStr.split("WEB-INF");
		System.out.println(pathStrArr[0]);
	}
}
