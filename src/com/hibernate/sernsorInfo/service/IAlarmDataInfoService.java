package com.hibernate.sernsorInfo.service;

import java.util.Date;
import java.util.List;

import com.hibernate.base.IBaseService;
import com.hibernate.sernsorInfo.domain.AlarmDataInfoBean;

public interface IAlarmDataInfoService extends IBaseService<AlarmDataInfoBean> {
	
	public List<AlarmDataInfoBean> getAlarmListByStatus(String status, int pageNo, int pageSize,String userId);
	
	public List<AlarmDataInfoBean> getAlarmListByHql(String hql, int pageNo, int pageSize);
	public List<AlarmDataInfoBean> getAlarmListByPageSize(int pageIndex, int total, String hql);

	public List<AlarmDataInfoBean> getAlarmListByDate(Date startDate, Date endDate, int pageNo, int pageSize,String userId);

	public void changeAllAlarmStatusByUserId(String userId);
	
	public void changeAlarmStatusById(String id);
	
	public int getAlarmCountByAoJianId(String aoJianId);
	
	public void deleteAlarmDataByAoJianDataId(String aoJianDataId);
}
