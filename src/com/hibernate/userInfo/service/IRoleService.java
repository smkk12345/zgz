package com.hibernate.userInfo.service;

import java.util.List;

import com.hibernate.userInfo.damain.RoleBean;

public interface IRoleService {
	public RoleBean save(RoleBean entity);
	
	public void update(RoleBean entity);
	
	public void delete(String id);
	
	public RoleBean getById(String id);

	public List<RoleBean> getByIds(String[] ids);

	public List<RoleBean> findAll();
	
}
