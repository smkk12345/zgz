package com.hibernate.sernsorInfo.dao;

import java.util.Date;
import java.util.List;

import com.hibernate.base.IBaseDao;
import com.hibernate.sernsorInfo.domain.AoJianDataBean;

public interface IAoJianDataDao extends IBaseDao<AoJianDataBean> {
	public AoJianDataBean getByGrainIdAndDate(String grainId, Date startDate);
	public AoJianDataBean getRecentAoJianDataBeanByGrainId(String grainId);
	public List<AoJianDataBean> getAoJianDataList(String grainId,String startDate,String endDate);
	public List<AoJianDataBean> getOrderedAoJianDataList(String grainId,String startDate,String endDate,int pageNo, int pageSize);
	public AoJianDataBean getRecentAoJianDataBeanByNothing();
	public int getTotalNumByParam(String grainId, String startDateStr,String endDateStr);
	public List<AoJianDataBean> getChartAoJianDataList(String grainId,String startDate,String endDate);
}
