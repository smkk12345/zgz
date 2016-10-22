package com.hibernate.timers.dao.impl;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import com.hibernate.base.BaseDaoImpl;
import com.hibernate.timers.dao.ITimerDao;
import com.hibernate.timers.domain.TimerTaskBean;

public class TimerDaoImpl extends BaseDaoImpl<TimerTaskBean> implements ITimerDao {

	@Override
	public TimerTaskBean save(TimerTaskBean entity) {
		// TODO Auto-generated method stub
		return super.save(entity);
	}

	@Override
	public void update(TimerTaskBean entity) {
		// TODO Auto-generated method stub
		super.update(entity);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		super.delete(id);
	}

	@Override
	public TimerTaskBean getById(String id) {
		// TODO Auto-generated method stub
		return super.getById(id);
	}

	@Override
	public List<TimerTaskBean> getByIds(String[] ids) {
		// TODO Auto-generated method stub
		return null;
	}

	 @Override
	 public List<TimerTaskBean> findAll() {
	  Session s = null;
	  List<TimerTaskBean> list = new ArrayList<TimerTaskBean>();
	  try {
	   s = getSession();
	   list = s.createCriteria(clazz).addOrder(Order.asc("createTime")).list();
	  } catch (Exception e) {
	   e.printStackTrace();
	  } finally {
	   s.close();
	  }
	  return list;
	 }


}
