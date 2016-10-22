package com.spring.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import com.common.pointTem.CoordinatorExchangeTemInterface;
import com.common.utils.CommonUtils;
import com.common.utils.StringUtils;
import com.hibernate.barnInfo.domain.AoJianBean;
import com.hibernate.barnInfo.domain.AoJianGrainInfoBean;
import com.hibernate.baseSettingInfo.domain.AlarmBean;
import com.hibernate.baseSettingInfo.domain.BaseSettingBean;
import com.hibernate.baseSettingInfo.domain.GrainTypeBean;
import com.hibernate.sernsorInfo.domain.SensorArrangementBean;
import com.spring.ServiceManager;

public class ControllerUtils {
	/**
	* @名称: updateAlarmInSession 
	* @日期：2015-10-9 下午3:55:42
	* @作者： lxb
	* @描述: 更新告警阈值信息
	* @参数 @param bean
	* @参数 @param s    
	* @返回值 void    
	* @异常
	 */
	public static void updateAlarmInSession(AoJianBean bean,HttpSession s){
		AoJianGrainInfoBean grainBean = bean.getAoJianGrainInfoBean();
		Map<String, AlarmBean> map = new HashMap<String, AlarmBean>();
		if (null != grainBean) {
			map = getAlarmDataInfo(grainBean);
			s.removeAttribute("alarms");
			s.setAttribute("alarms", map);
		}
	}

	public static Map<String, AlarmBean> getAlarmDataInfo(
			AoJianGrainInfoBean grainBean) {
		Map<String, AlarmBean> result = new HashMap<String, AlarmBean>();
		List<AlarmBean> list = ServiceManager.getAlarmServiceImpl()
				.findListByType(grainBean.getStoreType());
		AlarmBean temAlarm;
		if (list.size() > 1) {
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getGrainBeanId()
						.equals(grainBean.getGrainType())) {
					temAlarm = list.get(i);
					result.put("tem", temAlarm);
					break;
				}
			}
		} else if (list.size() == 1) {
			temAlarm = list.get(0);
			result.put("tem", temAlarm);
		}
		GrainTypeBean grainTypeBean = ServiceManager.getGrainTypeServiceImpl()
				.getById(grainBean.getGrainType());
		List<AlarmBean> humList = ServiceManager.getAlarmServiceImpl()
				.findListByGrainBeanIdAndType("湿度", grainTypeBean);
		if (humList.size() > 0) {
			result.put("hum", humList.get(0));
		}
		GrainTypeBean grain = ServiceManager.getGrainTypeServiceImpl().getById(grainBean.getGrainType());
		AlarmBean wetAlarm =CommonUtils.getWetAlarm(grain);
		result.put("wet", wetAlarm);
		return result;
	}
	
	
	public static CoordinatorExchangeTemInterface getArrangementTemPathByArrangement(SensorArrangementBean arrangementBean){
		CoordinatorExchangeTemInterface result  = null;
		String temId = arrangementBean.getTemplateId();
		SensorArrangementBean temArrangementBean  = ServiceManager.getSensorArrangementServiceImpl().getById(temId);
		String temPath = temArrangementBean.getTemPath();
		if(!StringUtils.isEmpty(temPath)){
			try {
				result =  (CoordinatorExchangeTemInterface)Class.forName(temPath).newInstance();
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (Exception e){
				e.printStackTrace();
			}finally{
				return result;
			}
		}
		return result;
	}
}
