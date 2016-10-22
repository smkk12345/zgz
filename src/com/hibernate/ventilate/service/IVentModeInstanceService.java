package com.hibernate.ventilate.service;

import com.hibernate.base.IBaseService;
import com.hibernate.ventilate.domain.VentModeBean;
import com.hibernate.ventilate.domain.VentModeInstanceBean;

public interface IVentModeInstanceService extends IBaseService<VentModeInstanceBean> {
	
	public VentModeInstanceBean getVentModeByType(String type);
	
	public VentModeInstanceBean getCurVentByAoJianIdAndStatus(String aoJianId, String status, String type);
}
