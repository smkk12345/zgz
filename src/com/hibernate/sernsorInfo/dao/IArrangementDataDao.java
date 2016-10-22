package com.hibernate.sernsorInfo.dao;

import java.util.List;

import com.hibernate.base.IBaseDao;
import com.hibernate.sernsorInfo.domain.ArrangementDataBean;
import com.hibernate.sernsorInfo.domain.SensorArrangementBean;

public interface IArrangementDataDao extends IBaseDao<ArrangementDataBean> {

	public void batchSave(List<ArrangementDataBean> list);
	public List<ArrangementDataBean> getbyAoJianId(String zyAoJianId);
	public List<ArrangementDataBean> getbyAoJianIdAndArrangeId(String zyAoJianId,SensorArrangementBean sensorArrangementBean);
	public void deleteBeanByPosition(String strPos,SensorArrangementBean bean);
	public void addBeanByPosition(String strPos,SensorArrangementBean bean);
	public List<ArrangementDataBean> getDeleteBeanById(SensorArrangementBean bean);
	
	public void deleteDataBySensorArrangement(SensorArrangementBean bean);
	
	public  List<ArrangementDataBean>  getBeanBySensorArrangementId(SensorArrangementBean bean);
	public void clearSensorArrangementInfo(String id);
}