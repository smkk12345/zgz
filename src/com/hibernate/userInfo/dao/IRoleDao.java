package com.hibernate.userInfo.dao;

import java.util.List;

import com.hibernate.base.IBaseDao;
import com.hibernate.userInfo.damain.RoleBean;

public interface IRoleDao extends IBaseDao<RoleBean> {
	public List<RoleBean> findAll();
}
