package com.hibernate.ventilate.service.impl;

import java.util.List;
import com.hibernate.ventilate.dao.IVentModeBeanDao;
import com.hibernate.ventilate.dao.IVentModeInstanceBeanDao;
import com.hibernate.ventilate.domain.VentModeInstanceBean;
import com.hibernate.ventilate.service.IVentModeInstanceService;
import com.hibernate.ventilate.service.IVentModeService;

public class VentModeInstanceServiceImpl implements IVentModeInstanceService {
	
	private IVentModeInstanceBeanDao dao;
	public void setDao(IVentModeInstanceBeanDao dao) {
		this.dao = dao;
	}
	@Override
	public VentModeInstanceBean save(VentModeInstanceBean entity) {
		// TODO Auto-generated method stub
		return dao.save(entity);
	}
	@Override
	public void update(VentModeInstanceBean entity) {
		// TODO Auto-generated method stub
		dao.update(entity);
	}
	@Override
	public void delete(String id) {
		dao.delete(id);
	}
		
	@Override
	public void deleteList(List<VentModeInstanceBean> beans) {
//		dao
	}
	@Override
	public VentModeInstanceBean getById(String id) {
		// TODO Auto-generated method stub
		return dao.getById(id);
	}
	@Override
	public List<VentModeInstanceBean> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}
	@Override
	public VentModeInstanceBean getVentModeByType(String type) {
		// TODO Auto-generated method stub
		return dao.getVentModeByType(type);
	}
	@Override
	public VentModeInstanceBean getCurVentByAoJianIdAndStatus(String aoJianId,
			String status, String type) {
		// TODO Auto-generated method stub
		return dao.getCurVentByAoJianIdAndStatus(aoJianId, status, type);
	}
}
