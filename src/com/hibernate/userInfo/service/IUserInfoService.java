package com.hibernate.userInfo.service;

import java.util.List;

import com.hibernate.userInfo.damain.User;

public interface IUserInfoService {
	public User save(User entity);

	
	public void update(User entity);

	
	public void delete(String id);

	
	public User getById(String id);

	
	public List<User> getByIds(String[] ids);

	
	public List<User> findAll();
	
	public List<User> getByName(String name);
	
	public List<User> getListByRoleId(String roleId);
	
	public List<User> findByContent(String aoJianZyNum);

}
