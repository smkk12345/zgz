package com.hibernate.sernsorInfo.service.impl;

import java.util.List;

import com.hibernate.sernsorInfo.dao.ISensorDao;
import com.hibernate.sernsorInfo.domain.SensorBean;
import com.hibernate.sernsorInfo.service.ISensorService;

public class SensorServiceImpl implements ISensorService {

	private ISensorDao dao;
	public void setDao(ISensorDao dao) {
		this.dao = dao;
	}

	@Override
	public SensorBean save(SensorBean entity) {
		return dao.save(entity);
	}

	@Override
	public void update(SensorBean entity) {
		dao.update(entity);
	}

	@Override
	public void delete(String id) {
		dao.delete(id);
	}

	@Override
	public void deleteList(List<SensorBean> beans) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public SensorBean getById(String id) {
		return dao.getById(id);
	}

	@Override
	public List<SensorBean> findAll() {
		return dao.findAll();
	}

	@Override
	public List<SensorBean> getSensorListByType(String type) {
		// TODO Auto-generated method stub
		return dao.getSensorListByType(type);
	}

}
