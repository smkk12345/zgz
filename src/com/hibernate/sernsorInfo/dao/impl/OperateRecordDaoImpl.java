package com.hibernate.sernsorInfo.dao.impl;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.beanutils.DynaBean;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.beanutils.ResultSetDynaClass;
import org.hibernate.Query;
import org.hibernate.Session;

import com.hibernate.base.BaseDaoImpl;
import com.hibernate.sernsorInfo.dao.IOperateRecordDao;
import com.hibernate.sernsorInfo.domain.OperateRecordBean;

public class OperateRecordDaoImpl extends BaseDaoImpl<OperateRecordBean> implements IOperateRecordDao {

	@Override
	public OperateRecordBean save(OperateRecordBean entity) {
		// TODO Auto-generated method stub
		return super.save(entity);
	}

	@Override
	public void update(OperateRecordBean entity) {
		// TODO Auto-generated method stub
		super.update(entity);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		super.delete(id);
	}

	@Override
	public OperateRecordBean getById(String id) {
		// TODO Auto-generated method stub
		return super.getById(id);
	}

	@Override
	public List<OperateRecordBean> getByIds(String[] ids) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OperateRecordBean> findAll() {
		List<OperateRecordBean> list = new ArrayList<OperateRecordBean>();
		Session s = null;
		try {
			String sql = "from OperateRecordBean a order by a.operateTime desc";
			s = super.getSession();
			Query query = s.createQuery(sql);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		return list;
	}

	@Override
	public List<OperateRecordBean> getOperateRecordByHql(String hql, int pageNo, int pageSize) {
		List<OperateRecordBean> list = new ArrayList<OperateRecordBean>();
		Session s = null;
		try {
			s = getSession();
			String sql = "from OperateRecordBean a ";
			if (hql.length() > 0) {
				sql = sql + " where " + hql;
			}
			sql = sql + " order by a.operateTime desc";
			Query q = s.createQuery(sql);
			q.setFirstResult((pageNo - 1) * pageSize);
			q.setMaxResults(pageSize);
			list = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		return list;
	}

	@Override
	public int getTotalNumByHql(String hql) {
		// TODO Auto-generated method stub
		Session s = null;
		int totalNum = 0;
		try {
			s = getSession();
			String sql = "select count(a) from OperateRecordBean a ";
			if (hql.length() > 0) {
				sql = sql + " where " + hql;
			}
			Query q = s.createQuery(sql);
			totalNum = Integer.parseInt(q.uniqueResult().toString());

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		return totalNum;
	}

	@Override
	public List<OperateRecordBean> getOperateRecordByPageSize(int total, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		List<OperateRecordBean> list = new ArrayList<OperateRecordBean>();
		Session s = null;
		try {
			if (total < pageSize) {
				pageNo = 1;
				pageSize = total;
			} else if (pageSize * pageNo > total) {
				pageNo = (int) (total / pageSize)+1;
				pageSize = total-(pageNo-1)* pageSize;
			}
			s = getSession();
			Query q = s.createQuery("from OperateRecordBean a order by a.operateTime desc");
			q.setFirstResult((pageNo - 1) * pageSize);
			q.setMaxResults(pageSize);
			list = q.list();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		return list;
	}

	@Override
	public List<String> getOperateTypeList() {
		List<String> resultList = new ArrayList<String>();
		Session s = null;
		String sql = "select distinct operateType from lqt_default.operaterecord";
		try {
			s = super.getSession();
			Statement state = s.connection().createStatement();
			ResultSet set = state.executeQuery(sql);
			ResultSetDynaClass rsDynaClass = new ResultSetDynaClass(set);
			Iterator itr = rsDynaClass.iterator();
			while (itr.hasNext()) {
				DynaBean dBean = (DynaBean) itr.next();
				String operateType = (String) PropertyUtils.getSimpleProperty(dBean, "operatetype");
				resultList.add(operateType);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		return resultList;
	}
}
