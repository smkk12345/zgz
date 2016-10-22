package com.hibernate.sernsorInfo.service;

import java.util.Date;
import java.util.List;

import com.hibernate.base.IBaseService;
import com.hibernate.sernsorInfo.domain.AoJianDataBean;
import com.hibernate.sernsorInfo.domain.SensorDataBean;

public interface IAoJianBlockService extends IBaseService<AoJianDataBean>{
	
	public AoJianDataBean getByGrainIdAndDate(String grainId, Date startDate);
	
	public AoJianDataBean getRecentAoJianDataBeanByGrainId(String grainId);
	
	public List<SensorDataBean> getSensorDataList(AoJianDataBean dataBean,String hqlStr,String orderField);
	
	public List<AoJianDataBean> getAoJianDataList(String grainId,String startDate,String endDate);
	public List<SensorDataBean> getRencentSensorDataList(String grainId,String hqlStr,String orderField);
	
	public void updateSensorData(SensorDataBean sensorData);
	
	public List<AoJianDataBean> getOrderedAoJianDataList(String grainId,String startDate,String endDate,int pageNo, int pageSize);
	
	public List<Integer> getCableIndexListByAoJianDataId(String aoJianDataId);
	
	public AoJianDataBean getRecentAoJianDataBeanByNothing();
	
	public void deleteAoJianDataById(String aoJianDataId);
	
	public int getTotalNumByParam(String grainId, String startDateStr,String endDateStr);
	
	public List<AoJianDataBean> getChartAoJianDataList(String grainId,String startDate,String endDate);
}
