package com.hibernate.userInfo.service.impl;
import java.util.List;

import com.hibernate.userInfo.damain.RoleBean;
import com.hibernate.userInfo.dao.impl.RoleDaoImpl;
import com.hibernate.userInfo.service.IRoleService;

public class RoleServiceImpl implements IRoleService {
	private RoleDaoImpl dao;

	public void setDao(RoleDaoImpl dao) {
		this.dao = dao;
	}
	@Override
	public RoleBean save(RoleBean entity) {
		return dao.save(entity);
	}

	@Override
	public void update(RoleBean entity) {
		dao.update(entity);
	}

	@Override
	public void delete(String id) {
		dao.delete(id);
	}

	@Override
	public RoleBean getById(String id) {
		return dao.getById(id);
	}

	@Override
	public List<RoleBean> getByIds(String[] ids) {
		return dao.getByIds(ids);
	}

	@Override
	public List<RoleBean> findAll() {
		return dao.findAll();
	}
}
