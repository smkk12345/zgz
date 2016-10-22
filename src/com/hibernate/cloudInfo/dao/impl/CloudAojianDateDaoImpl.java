package com.hibernate.cloudInfo.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.hibernate.cloudInfo.dao.IcloudAojianDateDao;
import com.hibernate.cloudInfo.domain.CloudAojianDateBean;
import com.hibernate.sernsorInfo.domain.AoJianDataBean;
import com.hibernate.sernsorInfo.domain.ArrangementDataBean;

import com.hibernate.base.BaseDaoImpl;

public class CloudAojianDateDaoImpl extends BaseDaoImpl<CloudAojianDateBean> implements IcloudAojianDateDao {

	@Override
	public CloudAojianDateBean save(CloudAojianDateBean entity) {
		// TODO Auto-generated method stub
		return super.save(entity);
	}

	@Override
	public void update(CloudAojianDateBean entity) {
		// TODO Auto-generated method stub
		super.update(entity);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		super.delete(id);
	}

	@Override
	public CloudAojianDateBean getById(String id) {
		// TODO Auto-generated method stub
		return super.getById(id);
	}

	@Override
	public List<CloudAojianDateBean> getByIds(String[] ids) {
		// TODO Auto-generated method stub
		return super.getByIds(ids);
	}

	@Override
	public List<CloudAojianDateBean> findAll() {
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

	public void deleteList(List<CloudAojianDateBean> beans) {
		// TODO Auto-generated method stub

	}

	public List<CloudAojianDateBean> getByAoJianDataId(String aoJianDataId) {

		// TODO Auto-generated method stub
		Session s = null;
		List<CloudAojianDateBean> list = new ArrayList<CloudAojianDateBean>();
		try {
			s = getSession();
			list = s.createCriteria(clazz).add(Restrictions.eq("aoJianDataId", aoJianDataId)).list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		return list;
	}

	public List<CloudAojianDateBean> getByZyAoJianGrainNum(String id, int pageNo, int pageSize) {

		// TODO Auto-generated method stub
		Session s = null;
		
		List<CloudAojianDateBean> list = new ArrayList<CloudAojianDateBean>();
				
		try {
			s = getSession();
			String sql = "from CloudAojianDateBean a where a.zyAoJianGrainNum='" + id + "' order by a.lqTime desc";
			Query q = s.createQuery(sql);
			q.setFirstResult((pageNo-1)*pageSize);
			q.setMaxResults(pageSize);
			list = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			s.close();
		}
		
		return list;
	}

	public Integer getTotalNumByGrainNum(String id) {

		// TODO Auto-generated method stub
		Session s = null;
		int totalNum = 0;
		try {
			s = getSession();
			String hql = "select count(a) from CloudAojianDateBean a where a.zyAoJianGrainNum='" + id + "'";
			Query query = s.createQuery(hql);
			totalNum=Integer.parseInt(query.uniqueResult().toString());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		return totalNum;
	}

	public void deleteByAoJianDataId(String lqId) {
		// TODO Auto-generated method stub

		Session s = null;
		Transaction tx = null;
		String hql = "delete from CloudAojianDateBean cloudaojiandate where cloudaojiandate.aoJianDataId='" + lqId + "'";
		try {
			s = getSession();
			tx = s.beginTransaction();
			s.createQuery(hql).executeUpdate();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}

	}
}
