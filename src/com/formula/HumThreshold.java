package com.formula;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

//湿度阈值
public class HumThreshold {
	
	private static Map<String,Map<Double,Double>> map = new HashMap<String, Map<Double,Double>>(){{
		put("402881eb4f20bc7b014f20bcf9ad0002", new HashMap<Double, Double>(){{put(0.3351, 5.306*0.125-12.4);}});//小麦
		put("402881eb4f25946c014f259de6810002", new HashMap<Double, Double>(){{put(0.3032, 6.316*0.135-22.8);}});//籼稻
		put("402881eb4f2b12ce014f2b193fb30002", new HashMap<Double, Double>(){{put(0.3032, 5.306*0.145-12.4);}});//早粳稻
		put("402881eb4f2b12ce014f2b1974d10003", new HashMap<Double, Double>(){{put(0.3032, 5.306*0.145-12.4);}});//晚粳稻
		put("402881eb4f25946c014f259e430e0004", new HashMap<Double, Double>(){{put(0.298, 5.578*0.14-16.44);}});//玉米
		put("402881eb4f25946c014f259e775b0005", new HashMap<Double, Double>(){{put(0.1408, 3.68*0.13-22.7);}});//大豆
	}};
	/**
	 * 通过温度和粮食品种计算湿度值
	 * @param grainTypeId121212fais
	 * @param avgTem
	 * @return
	 */
	public static double getHumValue(String grainTypeId,double avgTem){
		double result = 0.00;
		Map<Double,Double> subMap = map.get(grainTypeId);
		Iterator<Double> it = subMap.keySet().iterator();
		while(it.hasNext()){
			Double curKey = it.next();
			result = curKey*avgTem+subMap.get(curKey);
			break;
		}
		return result;
	}
}
