package com.hibernate.ventilate.service;

import java.util.List;
import com.hibernate.base.IBaseService;
import com.hibernate.ventilate.domain.BaseDevice;
import com.hibernate.ventilate.domain.VentDeviceBean;

public interface IVentDeviceService extends IBaseService<VentDeviceBean> {
	public List<BaseDevice> getDeviceListByAoJianId(String aoJianId);
}
