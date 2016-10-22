package com.hibernate.ventilate.service.impl;

import java.util.List;
import com.hibernate.ventilate.dao.IVentModeBeanDao;
import com.hibernate.ventilate.domain.VentModeBean;
import com.hibernate.ventilate.service.IVentModeService;

public class VentModeServiceImpl implements IVentModeService {
	
	private IVentModeBeanDao dao;
	public void setDao(IVentModeBeanDao dao) {
		this.dao = dao;
	}
	@Override
	public VentModeBean save(VentModeBean entity) {
		// TODO Auto-generated method stub
		return dao.save(entity);
	}
	@Override
	public void update(VentModeBean entity) {
		// TODO Auto-generated method stub
		dao.update(entity);
	}
	@Override
	public void delete(String id) {
		dao.delete(id);
	}
		
	@Override
	public void deleteList(List<VentModeBean> beans) {
//		dao
	}
	@Override
	public VentModeBean getById(String id) {
		// TODO Auto-generated method stub
		return dao.getById(id);
	}
	@Override
	public List<VentModeBean> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}
	@Override
	public VentModeBean getVentModeByType(String type) {
		// TODO Auto-generated method stub
		return dao.getVentModeByType(type);
	}
}
