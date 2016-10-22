package com.hibernate.sernsorInfo.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.hibernate.base.BaseDaoImpl;
import com.hibernate.sernsorInfo.dao.IArrangementDataDao;
import com.hibernate.sernsorInfo.domain.ArrangementDataBean;
import com.hibernate.sernsorInfo.domain.SensorArrangementBean;

public class ArrangementDataDaoImpl extends BaseDaoImpl<ArrangementDataBean> implements IArrangementDataDao {

	@Override
	public ArrangementDataBean save(ArrangementDataBean entity) {
		return super.save(entity);
	}

	@Override
	public void update(ArrangementDataBean entity) {
		super.update(entity);
	}

	@Override
	public void delete(String id) {
		super.delete(id);
	}

	@Override
	public ArrangementDataBean getById(String id) {
		return super.getById(id);
	}

	@Override
	public List<ArrangementDataBean> getByIds(String[] ids) {
		return super.getByIds(ids);
	}

	@Override
	public List<ArrangementDataBean> findAll() {
		return super.findAll();
	}

	@Override
	public void batchSave(List<ArrangementDataBean> list) {
		Session s = null;
		Transaction tx = null;
		try{
			s = getSession();
			tx = s.beginTransaction();
			for (int i = 0; i < list.size(); i++) {
				s.save(list.get(i));
				if(i%20==0){
					s.flush();
					s.clear();
				}
			}
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
	}
	/** 
	 * 通过厫间ID获取布置传感器列表信息
	 */
	@Override
	public List<ArrangementDataBean> getbyAoJianId(String zyAoJianId) {
		// TODO Auto-generated method stub
		Session s = null;
		List<ArrangementDataBean> list = new ArrayList<ArrangementDataBean>();
		try {
			s = getSession();
			list = s.createCriteria(clazz).add(Restrictions.eq("zyAoJianId", zyAoJianId)).list();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			s.close();
		}
		return list;
	}
	/**
	 * 删除缆线方法
	 */
	@Override
	public void deleteBeanByPosition(String strPos,SensorArrangementBean bean) {
		Session s = null;
		Transaction tx = null;
		List<ArrangementDataBean> list = new ArrayList<ArrangementDataBean>();
		try{
			s = getSession();
			tx = s.beginTransaction();
			list = s.createCriteria(clazz).add(Restrictions.eq("sensorArrangementBean", bean)).add(Restrictions.like("position", strPos+"%")).list();
			for(ArrangementDataBean bean0:list){
				bean0.setIsDelete("0");
				s.save(bean0);
			}
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
	}

	@Override
	public List<ArrangementDataBean> getDeleteBeanById(SensorArrangementBean bean) {
		// TODO Auto-generated method stub
		Session s = null;
		List<ArrangementDataBean> list = new ArrayList<ArrangementDataBean>();
		try {
			s = getSession();
			list = s.createCriteria(clazz).add(Restrictions.eq("sensorArrangementBean", bean)).add(Restrictions.eq("isDelete", "0")).list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			s.close();
		}
		return list;
	}

	@Override
	public void addBeanByPosition(String strPos,SensorArrangementBean bean){
		// TODO Auto-generated method stub
		Session s = null;
		Transaction tx = null;
		List<ArrangementDataBean> list = new ArrayList<ArrangementDataBean>();
		try{
			s = getSession();
			tx = s.beginTransaction();
			list = s.createCriteria(clazz).add(Restrictions.eq("sensorArrangementBean",bean)).add(Restrictions.like("position", strPos+"%")).list();
			for(ArrangementDataBean bean0:list){
				bean0.setIsDelete("1");
				s.save(bean);
			}
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
	}

	@Override
	public  List<ArrangementDataBean>  getBeanBySensorArrangementId(SensorArrangementBean bean) {
		Session s = null;
		Transaction tx = null;
		List<ArrangementDataBean> list = new ArrayList<ArrangementDataBean>();
		try {
			s = getSession();
			tx = s.beginTransaction();
			list = s.createCriteria(clazz).add(Restrictions.eq("sensorArrangementBean", bean)).list();
			for(ArrangementDataBean bean0:list){
				s.delete(bean0);
			}
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			s.close();
		}
		return list;
	}

	@Override
	public void deleteDataBySensorArrangement(SensorArrangementBean bean) {
		Session s = null;
		Transaction tx = null;
		List<ArrangementDataBean> list = new ArrayList<ArrangementDataBean>();
		try {
			s = getSession();
			tx = s.beginTransaction();
			list = s.createCriteria(clazz).add(Restrictions.eq("sensorArrangementBean", bean)).list();
			for(ArrangementDataBean bean0:list){
				s.delete(bean0);
			}
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			s.close();
		}
	}

	@Override
	public List<ArrangementDataBean> getbyAoJianIdAndArrangeId(
			String zyAoJianId, SensorArrangementBean sensorArrangementBean) {
		Session s = null;
		List<ArrangementDataBean> list = new ArrayList<ArrangementDataBean>();
		try {
			s = getSession();
			list = s.createCriteria(clazz).add(Restrictions.eq("zyAoJianId", zyAoJianId)).add(Restrictions.eq("sensorArrangementBean", sensorArrangementBean)).list();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			s.close();
		}
		return list;
	}

	@Override
	public void clearSensorArrangementInfo(String id) {
		Session s = null;
		Transaction tx = null;
		String hql = "delete from ArrangementDataBean where sensorArrangementId='"+id+"'";
		try {
			s = getSession();
			tx = s.beginTransaction();
			s.createQuery(hql).executeUpdate();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			s.close();
		}
	}
}
