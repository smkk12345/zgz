package com.hibernate.ventilate.service.impl;

import java.util.List;
import com.hibernate.ventilate.dao.IWindowDeviceDao;
import com.hibernate.ventilate.domain.BaseDevice;
import com.hibernate.ventilate.domain.WindowDeviceBean;
import com.hibernate.ventilate.service.IWindowDeviceService;

public class WindowDeviceServiceImpl implements IWindowDeviceService {
	private IWindowDeviceDao dao;
	
	public void setDao(IWindowDeviceDao dao) {
		this.dao = dao;
	}
	@Override
	public WindowDeviceBean save(WindowDeviceBean entity) {
		// TODO Auto-generated method stub
		return dao.save(entity);
	}
	@Override
	public void update(WindowDeviceBean entity) {
		// TODO Auto-generated method stub
		dao.update(entity);
	}
	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		dao.delete(id);
	}
	@Override
	public void deleteList(List<WindowDeviceBean> beans) {
		// TODO Auto-generated method stub
	}
	@Override
	public WindowDeviceBean getById(String id) {
		// TODO Auto-generated method stub
		return dao.getById(id);
	}
	@Override
	public List<WindowDeviceBean> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}
	@Override
	public List<BaseDevice> getDeviceListByAoJianId(String aoJianId) {
		// TODO Auto-generated method stub
		return dao.getDeviceListByAoJianId(aoJianId);
	}
}
