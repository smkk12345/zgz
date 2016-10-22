package com.hibernate.ventilate.service.impl;

import java.util.List;
import com.hibernate.ventilate.dao.IVentDeviceDao;
import com.hibernate.ventilate.domain.BaseDevice;
import com.hibernate.ventilate.domain.VentDeviceBean;
import com.hibernate.ventilate.service.IVentDeviceService;

public class VentDeviceServiceImpl implements IVentDeviceService {
	
	private IVentDeviceDao dao;
	
	public void setDao(IVentDeviceDao dao) {
		this.dao = dao;
	}
	@Override
	public VentDeviceBean save(VentDeviceBean entity) {
		// TODO Auto-generated method stub
		return dao.save(entity);
	}
	@Override
	public void update(VentDeviceBean entity) {
		// TODO Auto-generated method stub
		dao.update(entity);
	}
	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		dao.delete(id);
	}
	@Override
	public void deleteList(List<VentDeviceBean> beans) {
		// TODO Auto-generated method stub
	}
	@Override
	public VentDeviceBean getById(String id) {
		// TODO Auto-generated method stub
		return dao.getById(id);
	}
	@Override
	public List<VentDeviceBean> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}
	@Override
	public List<BaseDevice> getDeviceListByAoJianId(String aoJianId) {
		// TODO Auto-generated method stub
		return dao.getDeviceListByAoJianId(aoJianId);
	}
}
