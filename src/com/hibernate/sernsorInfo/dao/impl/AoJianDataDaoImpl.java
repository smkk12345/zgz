package com.hibernate.sernsorInfo.dao.impl;

import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.common.utils.CalendarUtil;
import com.common.utils.MathUtil;
import com.common.utils.StringUtils;
import com.hibernate.barnInfo.domain.AoJianBean;
import com.hibernate.barnInfo.domain.AoJianGrainInfoBean;
import com.hibernate.base.BaseDaoImpl;
import com.hibernate.sernsorInfo.dao.IAoJianDataDao;
import com.hibernate.sernsorInfo.domain.AoJianDataBean;
import com.hibernate.sernsorInfo.domain.SensorDataBean;
import com.spring.ServiceManager;

public class AoJianDataDaoImpl extends BaseDaoImpl<AoJianDataBean> implements IAoJianDataDao {

	@Override
	public AoJianDataBean save(AoJianDataBean entity) {
		// TODO Auto-generated method stub
		return super.save(entity);
	}

	@Override
	public void update(AoJianDataBean entity) {
		// TODO Auto-generated method stub
		super.update(entity);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		super.delete(id);
	}

	@Override
	public AoJianDataBean getById(String id) {
		List<AoJianDataBean> list = new ArrayList<AoJianDataBean>();
		Session s = null;
		try {
			s = super.getSession();
			list = (List<AoJianDataBean>) s.createCriteria(clazz).add(Restrictions.eq("id", id)).list();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			s.close();
		}
		if (list.size() > 0) {
			return list.get(0);
		} else
			return null;
	}

	@Override
	public List<AoJianDataBean> getByIds(String[] ids) {
		// TODO Auto-generated method stub
		return super.getByIds(ids);
	}

	@Override
	public List<AoJianDataBean> findAll() {
		// TODO Auto-generated method stub
		return super.findAll();
	}

	@Override
	public AoJianDataBean getByGrainIdAndDate(String grainId, Date startDate) {
		List<AoJianDataBean> list = new ArrayList<AoJianDataBean>();
		Session s = null;
		try {
			s = super.getSession();
			list = (List<AoJianDataBean>) s.createCriteria(clazz).add(Restrictions.eq("startDate", startDate)).add(Restrictions.eq("zyAoJianGrainNum", grainId)).list();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			s.close();
		}
		if (list.size() > 0) {
			return list.get(0);
		} else
			return null;
	}

	/**
	 * 降序时间排列廒间数据，获取最近一次的检测数据
	 */
	@Override
	public AoJianDataBean getRecentAoJianDataBeanByGrainId(String grainId) {
		List<AoJianDataBean> list = new ArrayList<AoJianDataBean>();
		Session s = null;
		try {
			s = super.getSession();
			String sql = "from AoJianDataBean a where a.zyAoJianGrainNum='" + grainId + "' order by a.startDate desc";
			Query q = s.createQuery(sql);
			q.setMaxResults(1);
			list = q.list();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			s.close();
		}
		if (list.size() > 0) {
			return list.get(0);
		} else
			return null;
	}

	@Override
	public List<AoJianDataBean> getAoJianDataList(String grainId, String startDate, String endDate) {
		List<AoJianDataBean> list = new ArrayList<AoJianDataBean>();

		Session s = null;
		try {
			s = super.getSession();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			Date endDate2 = sdf.parse(endDate);

			Calendar calendar = Calendar.getInstance();

			calendar.setTime(endDate2);

			calendar.add(Calendar.DAY_OF_MONTH, 1);

			endDate = sdf.format(calendar.getTime());

			String hql = "  from AoJianDataBean aoJianData where aoJianData.zyAoJianGrainNum='" + grainId + "' and (aoJianData.startDate > '" + startDate + "' and aoJianData.startDate < '" + endDate + "') order by startDate asc";
			Query query = s.createQuery(hql);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		AoJianGrainInfoBean grainBean = ServiceManager.getAoJianGrainInfoServiceImpl().getById(grainId);
		AoJianBean aoJian = ServiceManager.getAoJianServiceImpl().getById(grainBean.getZyAoJianNum());
		adjustAoJianData(aoJian,list);
		return list;
	}

	private void adjustAoJianData(AoJianBean aoJian,List<AoJianDataBean> list){
		boolean idAdjustTem = null != aoJian.getAdjustTemNum()&&aoJian.getAdjustTemNum()!=0;
		boolean idAdjustHum = null != aoJian.getAdjustHumNum()&&aoJian.getAdjustHumNum()!=0;
		boolean idAdjustWet = null != aoJian.getAdjustWetNum()&&aoJian.getAdjustWetNum()!=0;
		DecimalFormat df = new DecimalFormat("#.0");
		for (int i = 0; i < list.size(); i++) {
			AoJianDataBean data = list.get(i);
			if(idAdjustTem){
				Double d = data.getJwz()+aoJian.getAdjustTemNum();
				data.setJwz(MathUtil.getFormatData(d, 1));
			}
			if(idAdjustHum){
				Double d = data.getJsz()+aoJian.getAdjustHumNum();
				data.setJsz(MathUtil.getFormatData(d, 1));
			}
			if(idAdjustWet){
				Double d = data.getJsf()+aoJian.getAdjustWetNum();
				data.setJsf(MathUtil.getFormatData(d, 1));
			}
		}
	}
	
	@Override
	public List<AoJianDataBean> getOrderedAoJianDataList(String grainId, String startDate, String endDate, int pageNo, int pageSize) {
		List<AoJianDataBean> list = new ArrayList<AoJianDataBean>();

		Session s = null;
		try {
			s = super.getSession();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			StringBuffer sb = new StringBuffer();
			sb.append("from AoJianDataBean aoJianData where 1=1 ");
			if(!StringUtils.isEmpty(grainId)){
				sb.append(" and aoJianData.zyAoJianGrainNum='" + grainId + "' ");
			}
			if(!StringUtils.isEmpty(startDate)){
				sb.append(" and aoJianData.startDate > '" + startDate + "' ");
			}//我有一壶酒 足以慰风尘
			if(!StringUtils.isEmpty(endDate)){
				Date endDate2 = sdf.parse(endDate);
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(endDate2);
				calendar.add(Calendar.DAY_OF_MONTH, 1);
				endDate = sdf.format(calendar.getTime());
				sb.append(" and aoJianData.startDate < '" + endDate + "' ");
			}
			sb.append(" order by startDate desc");
			Query q = s.createQuery(sb.toString());
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

	public int getTotalNumAoJianData(String grainId, String startDate, String endDate) {
		// TODO Auto-generated method stub
		Session s = null;
		int totalNum = 0;
		try {
			s = getSession();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date endDate2 = sdf.parse(endDate);
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(endDate2);
			calendar.add(Calendar.DAY_OF_MONTH, 1);
			endDate = sdf.format(calendar.getTime());
			
			String hql = "";
			hql = "select count(aoJianData) from AoJianDataBean aoJianData where aoJianData.zyAoJianGrainNum='" + grainId + "' and (aoJianData.startDate > '" + startDate + "' and aoJianData.startDate < '" + endDate + "')";

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
	public AoJianDataBean getRecentAoJianDataBeanByNothing() {
		List<AoJianDataBean> list = new ArrayList<AoJianDataBean>();
		Session s = null;
		try {
			s = super.getSession();
			String sql = "from AoJianDataBean a  order by a.startDate desc";
			Query q = s.createQuery(sql);
			q.setMaxResults(1);
			list = q.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		if (list.size() > 0) {
			return list.get(0);
		} else
			return null;
	}

	@Override
	public int getTotalNumByParam(String grainId, String startDateStr,
			String endDateStr) {
		int result;
		List<AoJianDataBean> list = new ArrayList<AoJianDataBean>();
		Session s = null;
		try {
			s = super.getSession();
			
			StringBuffer sb = new StringBuffer();
			sb.append("select count(*) from AoJianDataBean  where 1=1 ");
			if(!StringUtils.isEmpty(grainId)){
				sb.append(" and zyAoJianGrainNum='" + grainId + "' ");
			}
			if(!StringUtils.isEmpty(startDateStr)){
				sb.append(" and startDate > '" + startDateStr + "' ");
			}
			if(!StringUtils.isEmpty(endDateStr)){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date endDate2 = sdf.parse(endDateStr);
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(endDate2);
				calendar.add(Calendar.DAY_OF_MONTH, 1);
				endDateStr = sdf.format(calendar.getTime());
				sb.append(" and startDate < '" + endDateStr + "' ");
			}
			
			sb.append(" order by startDate desc");
			
			Query q = s.createQuery(sb.toString());
			result = Integer.parseInt(q.uniqueResult().toString());
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			s.close();
		}
		return result;
	}

	@Override
	public List<AoJianDataBean> getChartAoJianDataList(String grainId, String startDate, String endDate) {
		List<AoJianDataBean> list = new ArrayList<AoJianDataBean>();

		Session s = null;
		try {
			s = super.getSession();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			Date endDate2 = sdf.parse(endDate);

			Calendar calendar = Calendar.getInstance();

			calendar.setTime(endDate2);

			calendar.add(Calendar.DAY_OF_MONTH, 1);

			endDate = sdf.format(calendar.getTime());

			String hql = " select aoJianData.id, aoJianData.startDate,aoJianData.aoJianTem,aoJianData.aoJianhumidity,aoJianData.outerTem,aoJianData.outerHumidity,aoJianData.jwz,aoJianData.jsz,aoJianData.jsf, aoJianData.zyAoJianGrainNum from AoJianDataBean aoJianData where aoJianData.zyAoJianGrainNum='" + grainId + "' and (aoJianData.startDate > '" + startDate + "' and aoJianData.startDate < '" + endDate + "') order by startDate asc";
			
			Query query = s.createQuery(hql);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		return list;
	}
}
