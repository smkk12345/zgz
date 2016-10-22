package com.hibernate.sernsorInfo.dao;

import java.util.Date;
import java.util.List;
import com.hibernate.base.IBaseDao;
import com.hibernate.sernsorInfo.domain.AlarmDataInfoBean;
import com.hibernate.sernsorInfo.domain.SensorDataBean;

public interface IAlarmDataInfoDao extends IBaseDao<AlarmDataInfoBean> {
	public List<AlarmDataInfoBean> getAlarmListByStatus(String status, int pageNo, int pageSize,String userId);
	public List<AlarmDataInfoBean> getAlarmListByDate(Date startDate,Date endDate, int pageNo, int pageSize,String userId);
	public List<AlarmDataInfoBean> getAlarmListByHql(String hql, int pageNo, int pageSize);
	public List<AlarmDataInfoBean> getAlarmListByPageSize(int pageIndex, int total, String hql);
	public int getTotalNumByDate(Date startDate, Date endDate,String userId);
	public int getTotalNumByHql(String hql);
	public void changeAllAlarmStatusByUserId(String userId);
	public void changeAlarmStatusById(String id);
	public void changeAllAlarmStatusByHql(String hql);
	public int getAlarmNumByStatus(String str, String uid);
	public int getAlarmCountByAoJianId(String aoJianId);
	public void batchSave(List<AlarmDataInfoBean> list);
	public void deleteAlarmDataByAoJianDataId(String aoJianDataId);
}
