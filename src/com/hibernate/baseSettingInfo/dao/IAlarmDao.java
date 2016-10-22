package com.hibernate.baseSettingInfo.dao;

import java.util.List;

import com.hibernate.base.IBaseDao;
import com.hibernate.baseSettingInfo.domain.AlarmBean;
import com.hibernate.baseSettingInfo.domain.GrainTypeBean;

public interface IAlarmDao extends IBaseDao<AlarmBean> {
	public List<AlarmBean> findListByType(String alarmType);
	public List<AlarmBean> findListByGrainBeanIdAndType(String alarmType,GrainTypeBean grainBean);
	public void deleteAlarmByGrainId(String grainId);
	public List<AlarmBean> findWetListByArea(String area);
	public List<AlarmBean> findWetListByParam(GrainTypeBean grainBean,String area,String dyhfType);
}
