package com.hibernate.userInfo.dao.impl;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import com.hibernate.base.BaseDaoImpl;
import com.hibernate.userInfo.damain.User;
import com.hibernate.userInfo.dao.IUserInfoDao;


public class UserInfoDaoImpl extends BaseDaoImpl<User> implements IUserInfoDao {

	public UserInfoDaoImpl(){}

	@Override
	public List<User> getByName(String name) {
		Session s = null;
		List<User> list = null;
		try{
			s = getSession();
			list = s.createCriteria(User.class).add(Restrictions.eq("userName", name)).list();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		return list;
	}

	@Override
	public List<User> getListByRoleId(String roleId) {
		Session s = null;
		List<User> list = null;
		try{
			s = getSession();
			list = s.createCriteria(User.class).add(Restrictions.eq("rightLevel", roleId)).list();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		return list;
	}
	
	/**
	 * 获取廒间的所有管理员
	 */
	@Override
	public List<User> findByContent(String aoJianZyNum) {
		Session s = null;
		List<User> list = null;
		try{
			s = getSession();
			list = s.createCriteria(User.class).add(Restrictions.eq("rightLevel", "3")).add(Restrictions.like("right_Content", "%"+aoJianZyNum+"%")).list();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		return list;
	};
	
	@Override
	public List<User> findAll() {
		Session s = null;
		List<User> list = null;
		try{
			s = getSession();
			list= s.createCriteria(clazz).add(Restrictions.eq("builtInUser", "0")).addOrder(Order.asc("createTime")).list();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		return list;
	}
}
