package com.hibernate.ventilate.service.impl;

import java.util.List;
import com.hibernate.ventilate.dao.IFanDeviceDao;
import com.hibernate.ventilate.domain.BaseDevice;
import com.hibernate.ventilate.domain.FanDeviceBean;
import com.hibernate.ventilate.service.IFanDeviceService;

public class FanDeviceServiceImpl implements IFanDeviceService {
	
	private IFanDeviceDao dao;
	
	public void setDao(IFanDeviceDao dao) {
		this.dao = dao;
	}
	@Override
	public FanDeviceBean save(FanDeviceBean entity) {
		// TODO Auto-generated method stub
		return dao.save(entity);
	}
	@Override
	public void update(FanDeviceBean entity) {
		dao.update(entity);
	}       
	@Override
	public void delete(String id) {
		dao.delete(id);
	}
	@Override
	public void deleteList(List<FanDeviceBean> beans) {
		// TODO Auto-generated method stub
	}
	@Override
	public FanDeviceBean getById(String id) {
		// TODO Auto-generated method stub
		return dao.getById(id);
	}
	@Override
	public List<FanDeviceBean> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}
	@Override
	public List<BaseDevice> getDeviceListByAoJianId(String aoJianId) {
		// TODO Auto-generated method stub
		return dao.getDeviceListByAoJianId(aoJianId);
	}
}
