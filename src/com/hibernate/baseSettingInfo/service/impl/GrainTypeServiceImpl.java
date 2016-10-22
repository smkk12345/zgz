package com.hibernate.baseSettingInfo.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.hibernate.baseSettingInfo.dao.impl.GrainTypeDaoImpl;
import com.hibernate.baseSettingInfo.domain.GrainTypeBean;
import com.hibernate.baseSettingInfo.service.IGrainTypeService;

public class GrainTypeServiceImpl implements IGrainTypeService {

	private GrainTypeDaoImpl dao;

	public void setDao(GrainTypeDaoImpl dao) {
		this.dao = dao;
	}
	@Override
	public GrainTypeBean save(GrainTypeBean entity) {
		// TODO Auto-generated method stub
		return dao.save(entity);
	}

	@Override
	public void update(GrainTypeBean entity) {
		// TODO Auto-generated method stub
		dao.update(entity);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		dao.delete(id);
	}

	@Override
	public void deleteList(List<GrainTypeBean> beans) {
		// TODO Auto-generated method stub
//		dao.delete(id)
	}

	@Override
	public GrainTypeBean getById(String id) {
		// TODO Auto-generated method stub
		return dao.getById(id);
	}

	@Override
	public List<GrainTypeBean> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	public List<GrainTypeBean> getByGraintype(String graintype) {
		return dao.getByGraintype(graintype);
	}
}
