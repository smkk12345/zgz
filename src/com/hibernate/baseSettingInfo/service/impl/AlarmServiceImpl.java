package com.hibernate.baseSettingInfo.service.impl;

import java.util.List;

import com.hibernate.baseSettingInfo.dao.impl.AlarmDaoImpl;
import com.hibernate.baseSettingInfo.domain.AlarmBean;
import com.hibernate.baseSettingInfo.domain.GrainTypeBean;
import com.hibernate.baseSettingInfo.service.IAlarmService;

public class AlarmServiceImpl implements IAlarmService {

	private AlarmDaoImpl dao;

	public void setDao(AlarmDaoImpl dao) {
		this.dao = dao;
	}

	@Override
	public AlarmBean save(AlarmBean entity) {
		// TODO Auto-generated method stub
		return dao.save(entity);
	}

	@Override
	public void update(AlarmBean entity) {
		// TODO Auto-generated method stub
		dao.update(entity);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		dao.delete(id);
	}

	@Override
	public void deleteList(List<AlarmBean> beans) {
		// TODO Auto-generated method stub
		// dao.delete(id)
	}

	@Override
	public AlarmBean getById(String id) {
		// TODO Auto-generated method stub
		return dao.getById(id);
	}

	@Override
	public List<AlarmBean> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	public List<AlarmBean> findListByType(String alarmType) {
		// TODO Auto-generated method stub
		return dao.findListByType(alarmType);
	}

	public List<AlarmBean> findListByGrainBeanIdAndType(String alarmType, GrainTypeBean grainBean) {
		// TODO Auto-generated method stub
		return dao.findListByGrainBeanIdAndType(alarmType, grainBean);
	}

	public List<AlarmBean> findWetListByArea(String area) {
		// TODO Auto-generated method stub
		return dao.findWetListByArea(area);
	}

	public void deleteAlarmByGrainId(String grainId) {
		// TODO Auto-generated method stub
		dao.deleteAlarmByGrainId(grainId);
	}

	@Override
	public List<AlarmBean> findWetListByParam(GrainTypeBean grainBean,
			String area, String dyhfType) {
		return dao.findWetListByParam(grainBean, area, dyhfType);
	}

}
