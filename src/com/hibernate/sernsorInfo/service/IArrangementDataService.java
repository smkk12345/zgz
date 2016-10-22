package com.hibernate.sernsorInfo.service;

import java.util.List;

import com.hibernate.base.IBaseService;
import com.hibernate.sernsorInfo.domain.ArrangementDataBean;
import com.hibernate.sernsorInfo.domain.SensorArrangementBean;

public interface IArrangementDataService extends IBaseService<ArrangementDataBean> {
	
	public void batchSave(List<ArrangementDataBean> list);
	public List<ArrangementDataBean> getbyAoJianId(String zyAoJianId);
	
	public void deleteBeanByPosition(String strPos,SensorArrangementBean bean);
	
	public void addBeanByPosition(String strPos,SensorArrangementBean bean);
	
	public List<ArrangementDataBean> getDeleteBeanById(String id);
	public List<ArrangementDataBean> getbyAoJianIdAndArrangeId(String zyAoJianId,SensorArrangementBean sensorArrangementBean);
	/**
	* @名称: deleteBeanByAoJianId 
	* @日期：2015-11-9 上午10:17:39
	* @作者： lxb
	* @描述: 删除布置信息通过廒间Id 当廒间切换了不执行至后先清空之前的布置信息
	* @参数 @param aoJianId    
	* @返回值 void    
	* @异常
	 */
	public void clearSensorArrangementInfo(String id);
}
