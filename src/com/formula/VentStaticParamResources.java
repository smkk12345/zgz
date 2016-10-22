package com.formula;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 通风参数设置
 * @author lxb
 *
 */
//VentModeBean temBean = getVentBeanByType("tem");
//model.addAttribute("temBean", temBean);
//
//VentModeBean wetBean = getVentBeanByType("wet");
//model.addAttribute("wetBean", wetBean);
//
//VentModeBean dewBean = getVentBeanByType("dew");
//model.addAttribute("dewBean", dewBean);
//
//VentModeBean headingBean = getVentBeanByType("heading");
//model.addAttribute("headingBean", headingBean);
//
//VentModeBean temperingBean = getVentBeanByType("tempering");

////通风模式
//private String ventType;
////保水通风
//private String waterRetention;
////保水通风系数
//private String waterRetentionFactor;
////目标粮温
//private Double targetTem;
////温差
//private Double temDiffer;
////进气与出气的温差
//private Double airInOutTemDiffer;
////进气与出气的水分差
//private Double airInOutWetDiffer;
////空气相对湿度
//private Double airRelativeHum;
////风速
//private Double windSpeed;
//
//private String id;
////自动通风 0未开始 1开始
//private String autoMode;
////通风开始条件判别  0未开始 1 开始
//private String startVentDistinguish;
public class VentStaticParamResources {
	//不同区域降温通风控制参数默认值
	private static Map<String,Map<String,String>> temDefaultParamMap = null;
	
	public static Map<String,Map<String,String>> getTemDefaultParamMap(){
		if(temDefaultParamMap == null){
			temDefaultParamMap = new HashMap<String, Map<String,String>>(){{
				put("area1", new HashMap<String, String>(){{
					//put("", value);
				}});
			}};
			return temDefaultParamMap;
		}else{
			return temDefaultParamMap;
		}
	}

}
