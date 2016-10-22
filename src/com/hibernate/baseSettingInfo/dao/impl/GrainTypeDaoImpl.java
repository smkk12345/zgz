package com.hibernate.baseSettingInfo.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.hibernate.base.BaseDaoImpl;
import com.hibernate.baseSettingInfo.dao.IGrainTypeDao;
import com.hibernate.baseSettingInfo.domain.GrainTypeBean;
import com.hibernate.cloudInfo.domain.CloudPicBean;

public class GrainTypeDaoImpl extends BaseDaoImpl<GrainTypeBean> implements IGrainTypeDao {

	@Override
	public GrainTypeBean save(GrainTypeBean entity) {
		// TODO Auto-generated method stub
		return super.save(entity);
	}

	@Override
	public void update(GrainTypeBean entity) {
		// TODO Auto-generated method stub
		super.update(entity);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		super.delete(id);
	}

	@Override
	public GrainTypeBean getById(String id) {
		// TODO Auto-generated method stub
		return super.getById(id);
	}

	@Override
	public List<GrainTypeBean> getByIds(String[] ids) {
		// TODO Auto-generated method stub
		return super.getByIds(ids);
	}

	@Override
	public List<GrainTypeBean> findAll() {
		Session s = null;
		List<GrainTypeBean> list = new ArrayList<GrainTypeBean>();
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
	public Session getSession() {
		// TODO Auto-generated method stub
		return super.getSession();
	}

	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return super.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return super.equals(obj);
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return super.clone();
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}

	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
	}

	public List<GrainTypeBean> getByGraintype(String graintype) {
		// TODO Auto-generated method stub
		Session s = null;
		List<GrainTypeBean> list = new ArrayList<GrainTypeBean>();
		try {
			s = getSession();
			list = s.createCriteria(clazz).add(Restrictions.eq("grainType", graintype)).list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		return list;
	}

}
