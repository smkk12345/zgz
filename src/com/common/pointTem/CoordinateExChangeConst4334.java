package com.common.pointTem;

import java.util.HashMap;
import java.util.Map;
import com.hibernate.sernsorInfo.domain.SensorArrangementBean;

public class CoordinateExChangeConst4334 implements CoordinatorExchangeTemInterface{
	
	public Map<Integer, String> getCoordinateMap(SensorArrangementBean sensorArrangementBean){
		Map<Integer, String> resultMap = new HashMap<Integer, String>();
		if(null != sensorArrangementBean){
			String str = sensorArrangementBean.getStartCablePos().trim()+"#"+sensorArrangementBean.getCableDirection();
			resultMap = map.get(str);
		}
		return resultMap;
	}
	
	private static Map<String, Map<Integer, String>> map = new HashMap<String, Map<Integer,String>>(){{
		put("东南#按行排序", getsoutheastRowMap());

	}};
	
	//东南角--行
	private static Map<Integer, String> getsoutheastRowMap() { return new HashMap<Integer, String>() {
			{
				put(1, "0,0");
				put(2, "0,2");
				put(3, "0,4");
				put(4, "0,6");
				
				put(5, "1,1");
				put(6, "1,3");
				put(7, "1,5");
				
				put(8, "2,1");
				put(9, "2,3");
				put(10, "2,5");
	
				put(11, "3,0");
				put(12, "3,2");
				put(13, "3,4");
				put(14, "3,6");
			}
		};
		}
	
}
