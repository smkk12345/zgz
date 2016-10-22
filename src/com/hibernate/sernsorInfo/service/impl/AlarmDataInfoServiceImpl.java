package com.hibernate.sernsorInfo.service.impl;

import java.util.Date;
import java.util.List;

import com.hibernate.baseSettingInfo.dao.IAlarmDao;
import com.hibernate.baseSettingInfo.dao.impl.AlarmDaoImpl;
import com.hibernate.sernsorInfo.dao.IAlarmDataInfoDao;
import com.hibernate.sernsorInfo.domain.AlarmDataInfoBean;
import com.hibernate.sernsorInfo.service.IAlarmDataInfoService;

public class AlarmDataInfoServiceImpl implements IAlarmDataInfoService {

	private IAlarmDataInfoDao dao;

	public void setDao(IAlarmDataInfoDao dao) {
		this.dao = dao;
	}

	@Override
	public AlarmDataInfoBean save(AlarmDataInfoBean entity) {
		// TODO Auto-generated method stub
		return dao.save(entity);
	}

	@Override
	public void update(AlarmDataInfoBean entity) {
		// TODO Auto-generated method stub
		dao.update(entity);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		dao.delete(id);
	}

	@Override
	public void deleteList(List<AlarmDataInfoBean> beans) {
		// TODO Auto-generated method stub
		// dao.delete()
	}

	@Override
	public AlarmDataInfoBean getById(String id) {
		// TODO Auto-generated method stub
		return dao.getById(id);
	}

	@Override
	public List<AlarmDataInfoBean> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public List<AlarmDataInfoBean> getAlarmListByStatus(String status, int pageNo, int pageSize,String userId) {
		// TODO Auto-generated method stub
		return dao.getAlarmListByStatus(status, pageNo, pageSize,userId);
	}

	@Override
	public List<AlarmDataInfoBean> getAlarmListByDate(Date startDate, Date endDate, int pageNo, int pageSize,String userId) {
		// TODO Auto-generated method stub
		return dao.getAlarmListByDate(startDate, endDate, pageNo, pageSize,userId);
	}

	@Override
	public List<AlarmDataInfoBean> getAlarmListByHql(String hql, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return dao.getAlarmListByHql(hql, pageNo, pageSize);
	}

	@Override
	public List<AlarmDataInfoBean> getAlarmListByPageSize(int pageIndex, int total, String hql) {
		// TODO Auto-generated method stub
		return dao.getAlarmListByPageSize(pageIndex, total, hql);
	}

	public int getTotalNumByDate(Date startDate, Date endDate,String userId) {
		// TODO Auto-generated method stub
		return dao.getTotalNumByDate(startDate, endDate,userId);
	}

	public int getTotalNumByHql(String hql) {
		// TODO Auto-generated method stub
		return dao.getTotalNumByHql(hql);
	}

	public int getAlarmNumByStatus(String str, String uid) {
		// TODO Auto-generated method stub
		return dao.getAlarmNumByStatus(str,uid);
	}

	@Override
	public void changeAllAlarmStatusByUserId(String userId) {
		// TODO Auto-generated method stub
		dao.changeAllAlarmStatusByUserId(userId);
	}

	@Override
	public void changeAlarmStatusById(String id) {
		// TODO Auto-generated method stub
		dao.changeAlarmStatusById(id);
	}
	public void changeAllAlarmStatusByHql(String hql) {
		// TODO Auto-generated method stub
		dao.changeAllAlarmStatusByHql(hql);
	}

	@Override
	public int getAlarmCountByAoJianId(String aoJianId) {
		// TODO Auto-generated method stub
		return dao.getAlarmCountByAoJianId(aoJianId);
	}

	public void batchSave(List list) {
		// TODO Auto-generated method stub
		dao.batchSave(list);
	}

	@Override
	public void deleteAlarmDataByAoJianDataId(String aoJianDataId) {
		// TODO Auto-generated method stub
		dao.deleteAlarmDataByAoJianDataId(aoJianDataId);
	}
}
