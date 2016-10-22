package com.hibernate.sernsorInfo.service.impl;

import java.util.List;

import com.hibernate.sernsorInfo.dao.impl.ExtensionDaoImpl;
import com.hibernate.sernsorInfo.domain.ExtensionBean;
import com.hibernate.sernsorInfo.service.IExtensionService;

public class ExtensionServiceImpl implements IExtensionService {

	private ExtensionDaoImpl dao;
	public void setDao(ExtensionDaoImpl dao) {
		this.dao = dao;
	}

	@Override
	public ExtensionBean save(ExtensionBean entity) {
		// TODO Auto-generated method stub
		return dao.save(entity);
	}

	@Override
	public void update(ExtensionBean entity) {
		// TODO Auto-generated method stub
		dao.update(entity);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		dao.delete(id);
	}

	@Override
	public void deleteList(List<ExtensionBean> beans) {
		// TODO Auto-generated method stub
//		dao.
	}

	@Override
	public ExtensionBean getById(String id) {
		// TODO Auto-generated method stub
		return dao.getById(id);
	}

	@Override
	public List<ExtensionBean> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

}
