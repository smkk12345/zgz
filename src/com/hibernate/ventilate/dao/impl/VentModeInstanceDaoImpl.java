package com.hibernate.ventilate.dao.impl;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import com.hibernate.base.BaseDaoImpl;
import com.hibernate.ventilate.dao.IVentModeInstanceBeanDao;
import com.hibernate.ventilate.domain.VentModeInstanceBean;

public class VentModeInstanceDaoImpl extends BaseDaoImpl<VentModeInstanceBean> implements IVentModeInstanceBeanDao {

	@Override
	public VentModeInstanceBean getVentModeByType(String type) {
		List<VentModeInstanceBean> list = new ArrayList<VentModeInstanceBean>();
		Session s = null;
		try {
			s = super.getSession();
			list = (List<VentModeInstanceBean>)s.createCriteria(clazz)
					.add(Restrictions.eq("ventType", type))
					.add(Restrictions.eq("globalPar", "0"))
					.list();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			s.close();
		}
		if(list.size()==0){
			return null;
		}
		else{
			return list.get(0);
		}
	}

	@Override
	public VentModeInstanceBean getCurVentByAoJianIdAndStatus(String aoJianId, String status, String type) {
		List<VentModeInstanceBean> list = new ArrayList<VentModeInstanceBean>();
		Session s = null;
		try {
			s = super.getSession();
			String[] statusArr = status.split("#");
			list = (List<VentModeInstanceBean>)s.createCriteria(clazz)
					.add(Restrictions.eq("aoJianId", aoJianId))
					.add(Restrictions.in("status", statusArr))
					.add(Restrictions.eq("ventType", type))
					.list();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			s.close();
		}
		if(list.size()==0){
			return null;
		}
		else{
			return list.get(0);
		}
	}
}
