package com.hibernate.userInfo.dao.impl;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import com.hibernate.base.BaseDaoImpl;
import com.hibernate.userInfo.damain.RoleBean;

public class RoleDaoImpl extends BaseDaoImpl<RoleBean>  {
	
	@Override
	public List<RoleBean> findAll() {
		Session s = null;
		List<RoleBean> list = null;
		try{
			s = getSession();
			list= s.createCriteria(clazz).add(Restrictions.eq("builtInRole", "0")).addOrder(Order.asc("createTime")).list();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		return list;
	}
}
