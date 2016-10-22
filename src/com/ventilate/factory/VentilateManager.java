package com.ventilate.factory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.common.consts.WebConstConfig;
import com.ventilate.factory.factories.CoolingVentilateFactory;
import com.ventilate.factory.factories.RainFallVentilateFactory;
import com.ventilate.factory.iVentilate.Ventilate;

public class VentilateManager {
	
	//所有通风管理器
	public static Map<String, Map<String,Ventilate>> ventilateMap = new HashMap<String, Map<String,Ventilate>>();
	
	/**
	* @名称: getVentilatesByAoJianId 
	* @日期：2015-12-7 下午3:22:33
	* @作者： lxb
	* @描述: 通过廒间Id获取通风对象列表----单例-----一次通风结束之后将改对象剔除出map，减少占用内存
	* @参数 @return    
	* @返回值 List<Ventilate>    
	* @异常
	 */
	public static Map<String,Ventilate> getVentilatesByAoJianId(String aoJianId){
		if(ventilateMap.containsKey(aoJianId)){
			return ventilateMap.get(aoJianId);
		}else{
			Map<String,Ventilate> ventilateMap1 = createVentilateListByAoJianId(aoJianId);
			ventilateMap.put(aoJianId, ventilateMap1);
			return ventilateMap1;
		}
	}
	/**
	* @名称: createVentilateListByAoJianId 
	* @日期：2015-12-7 下午3:25:48
	* @作者： lxb
	* @描述: 通过id创建通风对象----后续添加的在后面添加即可
	* @参数 @return    
	* @返回值 List<Ventilate>    
	* @异常
	 */
	private static Map<String,Ventilate> createVentilateListByAoJianId(String aoJianId) {
		Map<String,Ventilate> ventilateMap = new HashMap<String, Ventilate>();
		//降温通风
		Ventilate v = new CoolingVentilateFactory().createVentilate();
		v.setAoJianId(aoJianId);
		ventilateMap.put(WebConstConfig.jwtf, v);
		//降水通风
		Ventilate v1 = new RainFallVentilateFactory().createVentilate();
		v1.setAoJianId(aoJianId);
		ventilateMap.put(WebConstConfig.jstf, v1);
		
		return ventilateMap;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
