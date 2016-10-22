package com.hibernate.ventilate.dao;

import com.hibernate.base.IBaseDao;
import com.hibernate.ventilate.domain.VentModeBean;

public interface IVentModeBeanDao extends IBaseDao<VentModeBean> {
	public VentModeBean getVentModeByType(String type);
	
}
