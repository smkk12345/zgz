package com.hibernate.ventilate.dao;

import com.hibernate.base.IBaseDao;
import com.hibernate.ventilate.domain.VentModeBean;
import com.hibernate.ventilate.domain.VentModeInstanceBean;

public interface IVentModeInstanceBeanDao extends IBaseDao<VentModeInstanceBean> {
	public VentModeInstanceBean getVentModeByType(String type);
	public VentModeInstanceBean getCurVentByAoJianIdAndStatus(String aoJianId, String status, String type);
}
