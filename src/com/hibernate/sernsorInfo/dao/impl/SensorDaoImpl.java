package com.hibernate.sernsorInfo.dao.impl;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import com.hibernate.base.BaseDaoImpl;
import com.hibernate.sernsorInfo.dao.ISensorDao;
import com.hibernate.sernsorInfo.domain.SensorBean;

public class SensorDaoImpl extends BaseDaoImpl<SensorBean> implements ISensorDao {

	@Override
	public SensorBean save(SensorBean entity) {
		// TODO Auto-generated method stub
		return super.save(entity);
	}

	@Override
	public void update(SensorBean entity) {
		// TODO Auto-generated method stub
		super.update(entity);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		super.delete(id);
	}

	@Override
	public SensorBean getById(String id) {
		// TODO Auto-generated method stub
		return super.getById(id);
	}

	@Override
	public List<SensorBean> getByIds(String[] ids) {
		// TODO Auto-generated method stub
		return super.getByIds(ids);
	}

	 @Override
	 public List<SensorBean> findAll() {
	  Session s = null;
	  List<SensorBean> list = new ArrayList<SensorBean>();
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


	@Override
	public List<SensorBean> getSensorListByType(String type) {
		List<SensorBean> list = new ArrayList<SensorBean>();
		Session s = null;
		try {
			s = super.getSession();
			list = (List<SensorBean>) s.createCriteria(clazz).add(Restrictions.eq("sensorType", type)).list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		return list;
	}

}
