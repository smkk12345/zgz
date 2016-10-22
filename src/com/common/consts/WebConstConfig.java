package com.common.consts;

import com.hibernate.barnInfo.domain.AoJianBean;

public class WebConstConfig {
	
	public static String BASE_PATH = "/";
	public static String REAL_BASE_PATH = "";
	
	public static String getBase_Assets_Path(){
		return BASE_PATH+"assets/";
	}
	public static String getBase_Template_Default_Path(){
		return BASE_PATH+"template/default/";
	}
	
	//当前选择的廒间对象 
	public static AoJianBean curSelsectAoJianBean;
	
	public static double errorData = 10000;
	
	public static boolean hasVentilate = true;
	//降温通风
	public static String jwtf = "tem";
	//降水通风
	public static String jstf = "wet";
	//防结露通风
	public static String fjltf = "dew";
	//防结露通风
	public static String pjrtf = "heading";
	//调质通风
	public static String tztf = "tempering";
}
