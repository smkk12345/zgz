package com.common.pointTem;

import java.util.HashMap;
import java.util.Map;
import com.hibernate.sernsorInfo.domain.SensorArrangementBean;

public class CoordinateExChangeConst32323 implements CoordinatorExchangeTemInterface{
	
	public  Map<Integer, String> getCoordinateMap(SensorArrangementBean sensorArrangementBean){
		Map<Integer, String> resultMap = new HashMap<Integer, String>();
		if(null != sensorArrangementBean){
			String str = sensorArrangementBean.getStartCablePos().trim()+"#"+sensorArrangementBean.getCableDirection();
			resultMap = map.get(str);
		}
		return resultMap;
	}
	
	private static Map<String, Map<Integer, String>> map = new HashMap<String, Map<Integer,String>>(){{
		put("东北#按行排序", getnortheastRowMap());
		put("东北#按列排序", getnorthEastColumnMap());
		
		put("西北#按行排序", getnorthWestRowMap());
		put("西北#按列排序", getnorthWestColumnMap());
		
		put("西南#按行排序", getsouthwestRowMap());
		put("西南#按列排序", getsouthwestCloumnMap());
		
		put("东南#按行排序", getsoutheastRowMap());
		put("东南#按列排序", getsoutheastColumnMap());
	}};
	
	//东南角--行
	private static Map<Integer, String> getsoutheastRowMap() { return new HashMap<Integer, String>() {
			{
				put(1, "0,0");
				put(2, "0,2");
				put(3, "0,4");
				
				put(4, "1,1");
				put(5, "1,3");
				
				put(6, "2,0");
				put(7, "2,2");
				put(8, "2,4");
	
				put(9, "3,1");
				put(10, "3,3");
	
				put(11, "4,0");
				put(12, "4,2");
				put(13, "4,4");
			}
		};
		}
		//东南角--列
	private static Map<Integer, String> getsoutheastColumnMap(){return new HashMap<Integer, String>() {
			{
				put(1, "0,0");
				put(2, "2,0");
				put(3, "4,0");
				
				put(4, "1,1");
				put(5, "3,1");
				
				put(6, "0,2");
				put(7, "2,2");
				put(8, "4,2");

				put(9, "1,3");
				put(10, "3,3");

				put(11, "0,4");
				put(12, "2,4");
				put(13, "4,4");
			}
		};}
	
	//东北角--行
	private static Map<Integer, String> getnortheastRowMap(){return new HashMap<Integer, String>() {
		{
			put(1, "4,0");
			put(2, "4,2");
			put(3, "4,4");
			
			put(4, "3,1");
			put(5, "3,3");
			
			put(6, "2,0");
			put(7, "2,2");
			put(8, "2,4");

			put(9, "1,1");
			put(10, "1,3");

			put(11, "0,0");
			put(12, "0,2");
			put(13, "0,4");
		}
	};}
	//东北角--列
	private static Map<Integer, String> getnorthEastColumnMap() {return new HashMap<Integer, String>() {
		{
			put(1, "4,0");
			put(2, "2,0");
			put(3, "0,0");
			
			put(4, "3,1");
			put(5, "1,1");
			
			put(6, "4,2");
			put(7, "2,2");
			put(8, "0,2");

			put(9, "3,3");
			put(10, "1,3");

			put(11, "4,4");
			put(12, "2,4");
			put(13, "0,4");
		}
	};}
	//西北--行优先
	private static Map<Integer, String> getnorthWestRowMap() {return new HashMap<Integer, String>() {
		{
			put(1, "4,4");
			put(2, "4,2");
			put(3, "4,0");
			
			put(4, "3,3");
			put(5, "3,1");
			
			put(6, "2,4");
			put(7, "2,2");
			put(8, "2,0");

			put(9, "1,3");
			put(10, "1,1");

			put(11, "0,4");
			put(12, "0,2");
			put(13, "0,0");
		}
	};}
	//西北--列优先
	private static Map<Integer, String> getnorthWestColumnMap(){return new HashMap<Integer, String>() {
		{
			put(1, "4,4");
			put(2, "2,4");
			put(3, "0,4");
			
			put(4, "3,3");
			put(5, "1,3");
			
			put(6, "4,2");
			put(7, "2,2");
			put(8, "0,2");

			put(9, "3,1");
			put(10, "1,1");

			put(11, "4,0");
			put(12, "2,0");
			put(13, "0,0");
		}
	};}
	//西南-行优先
	private static Map<Integer, String> getsouthwestRowMap(){return  new HashMap<Integer, String>() {
		{
			put(1, "0,4");
			put(2, "0,2");
			put(3, "0,0");
			
			put(4, "1,3");
			put(5, "1,1");
			
			put(6, "2,4");
			put(7, "2,2");
			put(8, "2,0");

			put(9, "3,3");
			put(10, "3,1");

			put(11, "4,4");
			put(12, "4,2");
			put(13, "4,0");
		}
	};}
	//西南-列优先
	private static Map<Integer, String> getsouthwestCloumnMap() {return new HashMap<Integer, String>() {
		{
			put(1, "0,4");
			put(2, "2,4");
			put(3, "4,4");
			
			put(4, "1,3");
			put(5, "3,3");
			
			put(6, "0,2");
			put(7, "2,2");
			put(8, "4,2");

			put(9, "1,1");
			put(10, "3,1");

			put(11, "0,0");
			put(12, "2,0");
			put(13, "4,0");
		}
	};}
}
