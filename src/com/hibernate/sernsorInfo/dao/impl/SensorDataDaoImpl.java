package com.hibernate.sernsorInfo.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.jdbc.object.SqlQuery;

import com.common.utils.MathUtil;
import com.common.utils.StringUtils;
import com.hibernate.barnInfo.domain.AoJianBean;
import com.hibernate.barnInfo.domain.AoJianGrainInfoBean;
import com.hibernate.base.BaseDaoImpl;
import com.hibernate.sernsorInfo.dao.ISensorDataDao;
import com.hibernate.sernsorInfo.domain.AoJianDataBean;
import com.hibernate.sernsorInfo.domain.SensorDataBean;
import com.spring.ServiceManager;

public class SensorDataDaoImpl extends BaseDaoImpl<SensorDataBean> implements ISensorDataDao {

	@Override
	public SensorDataBean save(SensorDataBean entity) {
		// TODO Auto-generated method stub
		return super.save(entity);
	}

	@Override
	public void update(SensorDataBean entity) {
		// TODO Auto-generated method stub
		super.update(entity);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		super.delete(id);
	}

	@Override
	public SensorDataBean getById(String id) {
		// TODO Auto-generated method stub
		return super.getById(id);
	}

	@Override
	public List<SensorDataBean> getByIds(String[] ids) {
		// TODO Auto-generated method stub
		return super.getByIds(ids);
	}

	@Override
	public List<SensorDataBean> findAll() {
		// TODO Auto-generated method stub
		return super.findAll();
	}

	@Override
	public List<SensorDataBean> getSensorDataList(AoJianDataBean dataBean, String hqlStr, String orderField) {
		List<SensorDataBean> list = new ArrayList<SensorDataBean>();
		Session s = null;

		if (null == dataBean) {
			System.out.println("null Bean");
			return list;
		}
		try {
			s = getSession();
			try {
				Criteria criteria = s.createCriteria(clazz);
				criteria = criteria.add(Restrictions.eq("aoJianDataId", dataBean.getId()));
				if(!StringUtils.isEmpty(hqlStr)){
					criteria = criteria.add(Restrictions.like("sensorIndex", hqlStr));
				}
				criteria = 	criteria.addOrder(Order.asc(orderField));
				list = criteria.list();
			} catch (HibernateException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		AoJianGrainInfoBean grainBean = ServiceManager.getAoJianGrainInfoServiceImpl().getById(dataBean.getZyAoJianGrainNum());
		AoJianBean aoJian = ServiceManager.getAoJianServiceImpl().getById(grainBean.getZyAoJianNum());
		adjustAoJianData(aoJian,list);
		return list;
	}

	@Override
	public List<SensorDataBean> getRencentSensorDataList(AoJianDataBean dataBean, String hqlStr, String orderField) {
		List<SensorDataBean> list = new ArrayList<SensorDataBean>();
		Session s = null;

		if (null == dataBean) {
			System.out.println("null Bean");
			return list;
		}
		try {
			s = getSession();
			try {
				Criteria criteria = s.createCriteria(clazz);
				criteria = criteria.add(Restrictions.eq("aoJianDataId", dataBean.getId()));
				criteria = criteria.add(Restrictions.like("sensorIndex", hqlStr)).addOrder(Order.asc(orderField));
				list = criteria.list();
			} catch (HibernateException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		AoJianGrainInfoBean grainBean = ServiceManager.getAoJianGrainInfoServiceImpl().getById(dataBean.getZyAoJianGrainNum());
		AoJianBean aoJian = ServiceManager.getAoJianServiceImpl().getById(grainBean.getZyAoJianNum());
		adjustAoJianData(aoJian,list);
		return list;
	}

	public List<SensorDataBean> getSensorDataByAojianIdAndOrderIndex(String aojianId, String point) {
		// TODO Auto-generated method stub
		List<SensorDataBean> list = new ArrayList<SensorDataBean>();
		Session s = null;
		try {
			s = getSession();
			try {
				Criteria criteria = s.createCriteria(clazz);
				criteria = criteria.add(Restrictions.eq("aoJianDataId", aojianId));
				criteria = criteria.add(Restrictions.like("sensorIndex", point));
				list = criteria.list();
			} catch (HibernateException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		AoJianBean aoJian = ServiceManager.getAoJianServiceImpl().getById(aojianId);
		adjustAoJianData(aoJian,list);
		return list;
	}

	@Override
	public void batchSave(List<SensorDataBean> list) {
		// TODO Auto-generated method stub
		Session s = null;
		Transaction tx = null;
		try {
			s = getSession();
			tx = s.beginTransaction();
			for (int i = 0; i < list.size(); i++) {
				s.save(list.get(i));
				if (i % 20 == 0) {
					s.flush();
					s.clear();
				}
			}
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
	}

	public List<SensorDataBean> getSensorDataByNodate(AoJianDataBean aoJianDataBean, String hqlStr, String nodate, String orderField) {
		List<SensorDataBean> list = new ArrayList<SensorDataBean>();
		Session s = null;

		if (null == aoJianDataBean) {
			System.out.println("null Bean");
			return list;
		}
		try {
			s = getSession();
			try {
				Criteria criteria = s.createCriteria(clazz);
				criteria = criteria.add(Restrictions.eq("aoJianDataId", aoJianDataBean.getId()));
				criteria = criteria.add(Restrictions.eq("noData", nodate));
				criteria = criteria.add(Restrictions.like("sensorIndex", hqlStr)).addOrder(Order.asc(orderField));
				list = criteria.list();
			} catch (HibernateException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		AoJianGrainInfoBean grainBean = ServiceManager.getAoJianGrainInfoServiceImpl().getById(aoJianDataBean.getZyAoJianGrainNum());
		AoJianBean aoJian = ServiceManager.getAoJianServiceImpl().getById(grainBean.getZyAoJianNum());
		adjustAoJianData(aoJian,list);
		return list;
	}

	public List<SensorDataBean> getPointSensorDataByAojianIds(ArrayList<String> aojianIds, String point) {
		// TODO Auto-generated method stub
//		System.out.println("aojianIds="+aojianIds.get(0));
		List<SensorDataBean> list = new ArrayList<SensorDataBean>();
		if(null == aojianIds||aojianIds.size()==0){
			return list;
		}
		Session s = null;
		try {
			s = getSession();
			try {
				s = getSession();
				String sql = "from SensorDataBean a where a.sensorIndex = '" + point + "' and a.aoJianDataId in (:aojianIds)";
				Query q = s.createQuery(sql);
				q.setParameterList("aojianIds", aojianIds.toArray());
				list = q.list();
			} catch (HibernateException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		AoJianGrainInfoBean grainBean = ServiceManager.getAoJianGrainInfoServiceImpl().getById(aojianIds.get(0));
		AoJianBean aoJian = ServiceManager.getAoJianServiceImpl().getById(grainBean.getZyAoJianNum());
		adjustAoJianData(aoJian,list);
		return list;
	}

	@Override
	public List<Integer> getCableIndexListByAoJianDataId(String aoJianDataId) {
		List<Integer> result = new ArrayList<Integer>();
		String sql = "select distinct cableIndex from sensordata a where a.aoJianDataId = '"+aoJianDataId+"' and cableIndex is not null  order by cast(cableIndex as decimal(10,4)) asc ";
		Session s = null;
		Connection conn = null;
		Statement state = null;
		try {
			s = getSession();
			conn = s.connection();
			state = conn.createStatement();
			ResultSet rs = state.executeQuery(sql);
			while (rs.next()) {
				result.add(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(null != state){
				try {
					state.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}finally{
					state = null;
				}
			}
			if(null != conn){
				try {
					conn.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}finally{
					conn = null;
				}
			}
			s.close();
		}
		return result;
	}

	@Override
	public void deleteSensorDataByAoJianDataId(String aoJianDataId) {
		// TODO Auto-generated method stub
		List<Integer> result = new ArrayList<Integer>();
		String sql = "delete  from sensordata  where aoJianDataId = '"+aoJianDataId+"'";
		Session s = null;
		Connection conn = null;
		Statement state = null;
		try {
			s = getSession();
			conn = s.connection();
			state = conn.createStatement();
			state.execute(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(null != state){
				try {
					state.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}finally{
					state = null;
				}
			}
			if(null != conn){
				try {
					conn.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}finally{
					conn = null;
				}
			}
			s.close();
		}
	}
	
	/**
	* @名称: adjustAoJianData 
	* @日期：2016-2-19 下午5:05:45
	* @作者： lxb
	* @描述: 廒间数据调整
	* @参数 @param aoJian
	* @参数 @param list    
	* @返回值 void    
	* @异常
	 */
	private void adjustAoJianData(AoJianBean aoJian,List<SensorDataBean> list){
		boolean idAdjustTem = null != aoJian.getAdjustTemNum()&&aoJian.getAdjustTemNum()!=0;
		boolean idAdjustHum = null != aoJian.getAdjustHumNum()&&aoJian.getAdjustHumNum()!=0;
		boolean idAdjustWet = null != aoJian.getAdjustWetNum()&&aoJian.getAdjustWetNum()!=0;
		for (int i = 0; i < list.size(); i++) {
			SensorDataBean data = list.get(i);
			if(idAdjustTem){
				data.setTemperature(MathUtil.getFormatData(data.getTemperature()+aoJian.getAdjustTemNum(), 1));
			}
			if(idAdjustHum){
				data.setHumidity(MathUtil.getFormatData(data.getHumidity()+aoJian.getAdjustHumNum(), 1));
			}
			if(idAdjustWet){
				data.setWet(MathUtil.getFormatData(data.getWet()+aoJian.getAdjustWetNum(), 1));
			}
		}
	}
	
}
