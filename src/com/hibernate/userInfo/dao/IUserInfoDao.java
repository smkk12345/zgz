package com.hibernate.userInfo.dao;

import java.util.List;

import com.hibernate.userInfo.damain.User;

public interface IUserInfoDao {
	
	public List<User> getByName(String name);
	public List<User> getListByRoleId(String roleId);
	public List<User> findByContent(String aoJianZyNum);
}
