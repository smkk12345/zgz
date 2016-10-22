package com.hibernate.sernsorInfo.dao.impl;

import java.sql.Connection;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.common.utils.CalendarUtil;
import com.common.utils.StringUtils;
import com.hibernate.base.BaseDaoImpl;
import com.hibernate.sernsorInfo.dao.IAlarmDataInfoDao;
import com.hibernate.sernsorInfo.domain.AlarmDataInfoBean;
import com.hibernate.sernsorInfo.domain.ArrangementDataBean;
import com.hibernate.sernsorInfo.domain.OperateRecordBean;

public class AlarmDataInfoDaoImpl extends BaseDaoImpl<AlarmDataInfoBean> implements IAlarmDataInfoDao {

	@Override
	public List<AlarmDataInfoBean> getAlarmListByStatus(String status, int pageNo, int pageSize, String userId) {
		List<AlarmDataInfoBean> list = new ArrayList<AlarmDataInfoBean>();
		Session s = null;
		try {
			s = getSession();
			String sql = "";
			if (StringUtils.isEmpty(userId)) {
				sql = "from AlarmDataInfoBean a where a.status = '" + status + "'" + "order by a.alarmTime desc";
			} else {
				sql = "from AlarmDataInfoBean a where a.status = '" + status + "'" + " and userId = '" + userId + "'" + "order by a.alarmTime desc";
			}
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
	public List<AlarmDataInfoBean> getAlarmListByDate(Date startDate, Date endDate, int pageNo, int pageSize, String userId) {
		List<AlarmDataInfoBean> list = new ArrayList<AlarmDataInfoBean>();
		String startDateStr = CalendarUtil.formatStr(startDate, CalendarUtil.DATE_FORMAT_MODE4);
		endDate = CalendarUtil.getNextDate(endDate, 1, Calendar.DAY_OF_MONTH);
		String endDateStr = CalendarUtil.formatStr(endDate, CalendarUtil.DATE_FORMAT_MODE4);
		Session s = null;
		try {
			s = getSession();
			String hql = "";
			if (StringUtils.isEmpty(userId)) {
				hql = "from AlarmDataInfoBean as a where (a.alarmTime between '" + startDateStr + "' and '" + endDateStr + "')  order by a.alarmTime desc";

			} else {
				hql = "from AlarmDataInfoBean as a where (a.alarmTime between '" + startDateStr + "' and '" + endDateStr + "') and userId = '" + userId + "' order by a.alarmTime desc";
			}
			Query q = s.createQuery(hql);
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

	public int getTotalNumByDate(Date startDate, Date endDate, String userId) {
		// TODO Auto-generated method stub
		Session s = null;
		int totalNum = 0;
		try {
			String startDateStr = CalendarUtil.formatStr(startDate, CalendarUtil.DATE_FORMAT_MODE4);
			endDate = CalendarUtil.getNextDate(endDate, 1, Calendar.DAY_OF_MONTH);
			String endDateStr = CalendarUtil.formatStr(endDate, CalendarUtil.DATE_FORMAT_MODE4);
			s = getSession();
			String hql = "";
			if (StringUtils.isEmpty(userId)) {
				hql = "select count(a) from AlarmDataInfoBean a where  a.alarmTime between '" + startDateStr + "' and '" + endDateStr + "'";
			} else {
				hql = "select count(a) from AlarmDataInfoBean a where userId= '" + userId + "' and a.alarmTime between '" + startDateStr + "' and '" + endDateStr + "'";
			}
			Query query = s.createQuery(hql);
			totalNum = Integer.parseInt(query.uniqueResult().toString());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		return totalNum;
	}

	@Override
	public List<AlarmDataInfoBean> getAlarmListByHql(String hql, int pageNo, int pageSize) {
		List<AlarmDataInfoBean> list = new ArrayList<AlarmDataInfoBean>();
		Session s = null;
		try {
			s = getSession();
			String sql = "from AlarmDataInfoBean a ";
			if (hql.length() > 0) {
				sql = sql + " where " + hql;
			}
			sql = sql + " order by a.alarmTime desc";
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
			String sql = "select count(a) from AlarmDataInfoBean a ";
			if (hql.length() > 0) {
				sql = sql + " where " + hql;
			}
			Query query = s.createQuery(sql);
			totalNum = Integer.parseInt(query.uniqueResult().toString());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		return totalNum;
	}

	@Override
	public List<AlarmDataInfoBean> getAlarmListByPageSize(int pageIndex, int total, String hql) {
		List<AlarmDataInfoBean> list = new ArrayList<AlarmDataInfoBean>();
		Session s = null;
		try {
			s = super.getSession();
			String sql = "from AlarmDataInfoBean a ";
			if (hql.length() > 0) {
				sql = sql + " where " + hql;
			}
			sql = sql + " order by a.alarmTime desc";
			Query q = s.createQuery(sql);
			q.setFirstResult((pageIndex - 1) * total);
			q.setMaxResults(total);
			list = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		return list;
	}

	@Override
	public int getAlarmNumByStatus(String str, String userId) {
		// TODO Auto-generated method stub
		Session s = null;
		int totalNum = 0;
		try {
			s = getSession();
			String hql = "";
			if (StringUtils.isEmpty(userId)) {
				hql = "select count(a) from AlarmDataInfoBean a where a.status = '" + str + "'";
			} else {
				hql = "select count(a) from AlarmDataInfoBean a where a.status = '" + str + "' and userId='" + userId + "'";
			}
			Query query = s.createQuery(hql);
			totalNum = Integer.parseInt(query.uniqueResult().toString());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		return totalNum;
	}

	@Override
	public void changeAllAlarmStatusByUserId(String userId) {
		Session s = null;
		int totalNum = 0;
		Transaction tx = null;
		try {
			s = getSession();
			tx = s.beginTransaction();
			String hql = "UPDATE AlarmDataInfoBean SET status ='1' where userId='" + userId + "'";
			Query query = s.createQuery(hql);
			query.executeUpdate();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
	}

	@Override
	public void changeAlarmStatusById(String id) {
		Session s = null;
		int totalNum = 0;
		Transaction tx = null;
		try {
			s = getSession();
			tx = s.beginTransaction();
			String hql = "UPDATE AlarmDataInfoBean SET status ='1' where id='" + id + "'";
			Query query = s.createQuery(hql);
			query.executeUpdate();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
	}

	@Override
	public void changeAllAlarmStatusByHql(String hql) {
		Session s = null;
		Transaction tx = null;
		try {
			s = getSession();
			String sql = "UPDATE AlarmDataInfoBean  SET status ='1' ";
			if (hql.length() > 0) {
				tx = s.beginTransaction();
				sql = sql + " where " + hql;
				Query query = s.createQuery(sql);
				query.executeUpdate();
				tx.commit();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}

	}

	@Override
	public int getAlarmCountByAoJianId(String aoJianId) {
		Session s = null;
		int totalNum = 0;
		try {
			s = getSession();
			String hql = "select count(a) from AlarmDataInfoBean a where a.status = '0' and zyAoJianNum='" + aoJianId + "'";
			Query query = s.createQuery(hql);
			totalNum = Integer.parseInt(query.uniqueResult().toString());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		return totalNum;
	}
	
	@Override
	public void batchSave(List<AlarmDataInfoBean> list) {
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

	@Override
	public void deleteAlarmDataByAoJianDataId(String aoJianDataId) {
		String sql = "delete  from alarmdatainfo  where aoJianDataId = '"+aoJianDataId+"'";
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

}
