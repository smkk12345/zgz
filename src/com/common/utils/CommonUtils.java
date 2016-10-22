package com.common.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import com.hibernate.baseSettingInfo.domain.AlarmBean;
import com.hibernate.baseSettingInfo.domain.BaseSettingBean;
import com.hibernate.baseSettingInfo.domain.GrainTypeBean;
import com.spring.ServiceManager;

public class CommonUtils {
	private static Map<String,String> map = new HashMap<String, String>(){{
		put("南方", "江苏,浙江,上海,湖北,湖南,四川,重庆市,贵州,云南,广西,江西,福建,广东,海南,西藏,台湾,香港特区,澳门");
		put("北方", "内蒙古,黑龙江,吉林,辽宁,河北,河南,山东,山西,陕西");
		put("华北", "河北,山西,内蒙古,北京,天津,安徽");
		put("东北", "黑龙江,吉林,辽宁");
	}};
	
	private static Map<String,String> areaGrainTypeMap = new HashMap<String, String>(){{
		put("早籼稻,晚籼稻,粳稻", "qyhf2");
		put("玉米,小麦", "qyhf1");
	}};
	
	public static AlarmBean getWetAlarm(GrainTypeBean grainBean){
		AlarmBean result = null;
		String regionType = "";
		Iterator<String> it = areaGrainTypeMap.keySet().iterator();
		while (it.hasNext()) {
			String curKey = it.next();
			String value = areaGrainTypeMap.get(curKey);
			if(curKey.contains(grainBean.getGrainType())){
				regionType = value;
			}
		}
		//区域---south-----差一个 regionType--grainBean.getId
		String region = getAreaByRegionType(regionType);
		List<AlarmBean> alarmList = ServiceManager.getAlarmServiceImpl().findWetListByParam(grainBean, region, regionType);
		if(alarmList.size()>0){
			result = alarmList.get(0);
		}
		return result;
	}
	
	private static String getAreaByRegionType(String regionType){
		String result = "";
		BaseSettingBean bean = ServiceManager.getBaseSettingServiceImpl().findValueByKey(regionType);
		if(null!=bean){
			result = bean.getValue();
		}
		return result;
	}
	

}
