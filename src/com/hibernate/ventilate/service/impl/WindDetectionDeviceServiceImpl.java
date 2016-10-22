package com.hibernate.ventilate.service.impl;

import java.util.List;
import com.hibernate.ventilate.dao.IWindDetectionDeviceDao;
import com.hibernate.ventilate.domain.BaseDevice;
import com.hibernate.ventilate.domain.WindDetectionDeviceBean;
import com.hibernate.ventilate.service.IWindDetectionDeviceService;

public class WindDetectionDeviceServiceImpl implements
		IWindDetectionDeviceService {
	
	private IWindDetectionDeviceDao dao;
	
	public void setDao(IWindDetectionDeviceDao dao) {
		this.dao = dao;
	}
	@Override
	public WindDetectionDeviceBean save(WindDetectionDeviceBean entity) {
		// TODO Auto-generated method stub
		return dao.save(entity);
	}
	@Override
	public void update(WindDetectionDeviceBean entity) {
		// TODO Auto-generated method stub
		dao.update(entity);
	}
	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		dao.delete(id);
	}
	@Override
	public void deleteList(List<WindDetectionDeviceBean> beans) {
		// TODO Auto-generated method stub
	}
	@Override
	public WindDetectionDeviceBean getById(String id) {
		// TODO Auto-generated method stub
		return dao.getById(id);
	}
	@Override
	public List<WindDetectionDeviceBean> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}
	@Override
	public List<BaseDevice> getDeviceListByAoJianId(String aoJianId) {
		// TODO Auto-generated method stub
		return dao.getDeviceListByAoJianId(aoJianId);
	}
}
