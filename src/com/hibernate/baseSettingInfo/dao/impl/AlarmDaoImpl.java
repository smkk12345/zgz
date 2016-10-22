package com.hibernate.baseSettingInfo.dao.impl;

import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import com.hibernate.base.BaseDaoImpl;
import com.hibernate.baseSettingInfo.dao.IAlarmDao;
import com.hibernate.baseSettingInfo.domain.AlarmBean;
import com.hibernate.baseSettingInfo.domain.GrainTypeBean;

public class AlarmDaoImpl extends BaseDaoImpl<AlarmBean> implements IAlarmDao {

	@Override
	public AlarmBean save(AlarmBean entity) {
		// TODO Auto-generated method stub
		return super.save(entity);
	}

	@Override
	public void update(AlarmBean entity) {
		// TODO Auto-generated method stub
		super.update(entity);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		super.delete(id);
	}

	@Override
	public AlarmBean getById(String id) {
		// TODO Auto-generated method stub
		return super.getById(id);
	}

	@Override
	public List<AlarmBean> getByIds(String[] ids) {
		// TODO Auto-generated method stub
		return super.getByIds(ids);
	}

	@Override
	public List<AlarmBean> findAll() {
		// TODO Auto-generated method stub
		return super.findAll();
	}

	
	public List<AlarmBean> findListByType(String alarmType) {
		List<AlarmBean> list = new ArrayList<AlarmBean>();
		Session s = null;
		try {
			s = super.getSession();
			list = (List<AlarmBean>)s.createCriteria(clazz).add(Restrictions.eq("alarmType", alarmType)).addOrder(Order.asc("createDate")).list();
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			s.close();
		}
		return list;
	}

	
	public List<AlarmBean> findListByGrainBeanIdAndType(String alarmType, GrainTypeBean grainBean) {
		List<AlarmBean> list = new ArrayList<AlarmBean>();
		Session s = null;
		try {
			s = super.getSession();
			list = (List<AlarmBean>)s.createCriteria(clazz)
					.add(Restrictions.eq("alarmType", alarmType))
					.add(Restrictions.eq("grainBeanId", grainBean.getId()))
					.addOrder(Order.asc("createDate")).list();
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			s.close();
		}
		return list;
	}
	/**
	 * 通过地区 获取水分告警信息
	 */
	
	public List<AlarmBean> findWetListByArea(String area) {
		List<AlarmBean> list = new ArrayList<AlarmBean>();
		String[] areaArr = area.split(",");
		Session s = null;
		try {
			s = super.getSession();
			list = (List<AlarmBean>)s.createCriteria(clazz).add(Restrictions.eq("alarmType", "水份")).add(Restrictions.in("area", areaArr)).list();
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			s.close();
		}
		return list;
	}

	@Override
	public void deleteAlarmByGrainId(String grainId) {
		Session s = null;
		Statement state = null;
		Connection con = null;
		String sql = "DELETE FROM lqt_default.alarmavg where grainBeanId='"+grainId+"'"; 
		try {
			s = super.getSession();
			con = s.connection();
			state = con.createStatement();
			state.execute(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			if(null!=state){
				try {
					state.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if(null!=con){
				try {
					con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if(null!=s){
				s.close();
			}
		}
	}

	@Override
	public List<AlarmBean> findWetListByParam(GrainTypeBean grainBean,
			String area, String dyhfType) {
		List<AlarmBean> list = new ArrayList<AlarmBean>();
		Session s = null;
		try {
			s = super.getSession();
			StringBuffer sb = new StringBuffer();
			sb.append(" from AlarmBean where alarmPYType = ");
			sb.append(" 'wet' and area =  '");
			sb.append(area);
			sb.append("' and grainBeanId = '");
			sb.append(grainBean.getId() +"' and dyhfType = '");
			sb.append(dyhfType+"'");
			Query q = s.createQuery(sb.toString());
			list = q.list();
//			list = (List<AlarmBean>)s.createCriteria(clazz).add(Restrictions.eq("alarmPYType", "wet"))
//					.add(Restrictions.like("area", "%"+area+"%"))
//					.add(Restrictions.like("grainBeanId", "%"+grainBean.getId()+"%"))
//					.add(Restrictions.like("dyhfType", "%"+dyhfType+"%"))
//					.list();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			s.close();
		}
		return list;
	}
}
