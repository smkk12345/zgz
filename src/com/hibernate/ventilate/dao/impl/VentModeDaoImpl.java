package com.hibernate.ventilate.dao.impl;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import com.hibernate.base.BaseDaoImpl;
import com.hibernate.ventilate.dao.IVentModeBeanDao;
import com.hibernate.ventilate.domain.VentModeBean;

public class VentModeDaoImpl extends BaseDaoImpl<VentModeBean> implements IVentModeBeanDao {

	@Override
	public VentModeBean getVentModeByType(String type) {
		List<VentModeBean> list = new ArrayList<VentModeBean>();
		Session s = null;
		try {
			s = super.getSession();
			list = (List<VentModeBean>)s.createCriteria(clazz)
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
}
