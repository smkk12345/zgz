package com.hibernate.ventilate.dao.impl;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import com.hibernate.base.BaseDaoImpl;
import com.hibernate.ventilate.dao.IFanDeviceDao;
import com.hibernate.ventilate.domain.BaseDevice;
import com.hibernate.ventilate.domain.FanDeviceBean;

public class FanDeviceDaoImpl extends BaseDaoImpl<FanDeviceBean> implements IFanDeviceDao {

	@Override
	public List<BaseDevice> getDeviceListByAoJianId(String aoJianId) {
		List<BaseDevice> list = new ArrayList<BaseDevice>();
		Session s = null;
		try {
			s = super.getSession();
			list = (List<BaseDevice>)s.createCriteria(clazz)
					.add(Restrictions.eq("aoJianId", aoJianId))
					.addOrder(Order.asc("createTime"))
					.list();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			s.close();
		}
		return list;
	}
}
