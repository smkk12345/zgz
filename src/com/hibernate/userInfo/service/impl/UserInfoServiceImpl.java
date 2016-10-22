package com.hibernate.userInfo.service.impl;

import java.util.List;

import com.hibernate.userInfo.damain.User;
import com.hibernate.userInfo.dao.impl.UserInfoDaoImpl;
import com.hibernate.userInfo.service.IUserInfoService;

public class UserInfoServiceImpl implements IUserInfoService {
	private UserInfoDaoImpl dao;

	public void setDao(UserInfoDaoImpl dao) {
		this.dao = dao;
	}

	@Override
	public User save(User entity) {
		return dao.save(entity);
	}

	@Override
	public void update(User entity) {
		dao.update(entity);
	}

	@Override
	public void delete(String id) {
		dao.delete(id);
	}

	@Override
	public User getById(String id) {
		return dao.getById(id);
	}

	@Override
	public List<User> getByIds(String[] ids) {
		return dao.getByIds(ids);
	}

	@Override
	public List<User> findAll() {
		return dao.findAll();
	}

	@Override
	public List<User> getByName(String name) {
		return dao.getByName(name);
	}

	@Override
	public List<User> getListByRoleId(String roleId) {
		// TODO Auto-generated method stub
		return dao.getListByRoleId(roleId);
	}

	@Override
	public List<User> findByContent(String aoJianZyNum) {
		// TODO Auto-generated method stub
		return dao.findByContent(aoJianZyNum);
	}
}
