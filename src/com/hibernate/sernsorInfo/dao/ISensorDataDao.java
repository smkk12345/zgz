package com.hibernate.sernsorInfo.dao;

import java.util.List;

import com.hibernate.base.IBaseDao;
import com.hibernate.sernsorInfo.domain.AoJianDataBean;
import com.hibernate.sernsorInfo.domain.ArrangementDataBean;
import com.hibernate.sernsorInfo.domain.SensorDataBean;

public interface ISensorDataDao extends IBaseDao<SensorDataBean> {

	public List<SensorDataBean> getSensorDataList(AoJianDataBean dataBean,String hqlStr,String orderField);
	public List<SensorDataBean> getRencentSensorDataList(AoJianDataBean dataBean,String hqlStr,String orderField);
	public void batchSave(List<SensorDataBean> list);
	public List<Integer> getCableIndexListByAoJianDataId(String aoJianDataId);
	
	public void deleteSensorDataByAoJianDataId(String aoJianDataId);
}
