package com.hibernate.ventilate.service;

import com.hibernate.base.IBaseService;
import com.hibernate.ventilate.domain.VentModeBean;

public interface IVentModeService extends IBaseService<VentModeBean> {
	
	public VentModeBean getVentModeByType(String type);
}
