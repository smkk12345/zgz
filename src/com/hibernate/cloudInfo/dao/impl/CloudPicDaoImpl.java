package com.hibernate.cloudInfo.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.hibernate.base.BaseDaoImpl;
import com.hibernate.cloudInfo.dao.IcloudPicDao;
import com.hibernate.cloudInfo.domain.CloudPicBean;

public class CloudPicDaoImpl extends BaseDaoImpl<CloudPicBean> implements IcloudPicDao {

	@Override
	public CloudPicBean save(CloudPicBean entity) {
		// TODO Auto-generated method stub
		return super.save(entity);
	}

	@Override
	public void update(CloudPicBean entity) {
		// TODO Auto-generated method stub
		super.update(entity);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		super.delete(id);
	}

	@Override
	public CloudPicBean getById(String id) {
		// TODO Auto-generated method stub
		return super.getById(id);
	}

	@Override
	public List<CloudPicBean> getByIds(String[] ids) {
		// TODO Auto-generated method stub
		return super.getByIds(ids);
	}

	@Override
	public List<CloudPicBean> findAll() {
		// TODO Auto-generated method stub
		return super.findAll();
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

	public void deleteList(List<CloudPicBean> beans) {
		// TODO Auto-generated method stub

	}

	public List<CloudPicBean> getByAoJianDataIdAndYuTuTypeAndSection(String aoJianDataId, int yuTuType, String section) {
		// TODO Auto-generated method stub
		Session s = null;
		List<CloudPicBean> list = new ArrayList<CloudPicBean>();
		try {
			s = getSession();
			list = s.createCriteria(clazz).add(Restrictions.eq("aoJianDataId", aoJianDataId)).add(Restrictions.eq("yuTuType", yuTuType)).add(Restrictions.eq("section", section)).list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		return list;
	}

	public Integer deleteByAoJianDataId(String lqId) {
		// TODO Auto-generated method stub
		Session s = null;
		Transaction tx = null;
		System.out.println(lqId);
		String hql = "delete  from CloudPicBean cloudpic where cloudpic.aoJianDataId='" + lqId + "'";
		Integer count = 0;
		try {
			s = getSession();
			tx = s.beginTransaction();
			count = s.createQuery(hql).executeUpdate();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		return count;
	}

	public List<CloudPicBean> getByAoJianDataId(String lqId) {
		// TODO Auto-generated method stub
		Session s = null;
		List<CloudPicBean> list = new ArrayList<CloudPicBean>();
		try {
			s = getSession();
			list = s.createCriteria(clazz).add(Restrictions.eq("aoJianDataId", lqId)).list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		return list;
	}

	public List<CloudPicBean> getByAoJianDataIdAndYuTuType(String lqId, int yuTuType) {
		// TODO Auto-generated method stub
		Session s = null;
		List<CloudPicBean> list = new ArrayList<CloudPicBean>();
		try {
			s = getSession();
			list = s.createCriteria(clazz).add(Restrictions.eq("aoJianDataId", lqId)).add(Restrictions.eq("yuTuType", yuTuType)).addOrder(Order.asc("ViewOrder")).list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		return list;
	}

}
