package com.hibernate.baseSettingInfo.service;

import java.util.List;

import com.hibernate.base.IBaseService;
import com.hibernate.baseSettingInfo.domain.AlarmBean;
import com.hibernate.baseSettingInfo.domain.GrainTypeBean;

public interface IAlarmService extends IBaseService<AlarmBean> {
	public List<AlarmBean> findListByType(String alarmType);
	public List<AlarmBean> findListByGrainBeanIdAndType(String alarmType,GrainTypeBean grainBean);
	public List<AlarmBean> findWetListByArea(String area);
	public void deleteAlarmByGrainId(String grainId);
	/**
	* @名称: findListByParam 
	* @日期：2015-11-16 上午10:22:19
	* @作者： lxb
	* @描述: 获取水份阈值的时候使用，传递进去
	* @参数 @return    
	* @返回值 List<AlarmBean>    
	* @异常
	 */
	public List<AlarmBean> findWetListByParam(GrainTypeBean grainBean,String area,String dyhfType);
	
}
