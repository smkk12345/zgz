package com.hibernate.ventilate.dao;

import java.util.List;
import com.hibernate.base.IBaseDao;
import com.hibernate.ventilate.domain.BaseDevice;
import com.hibernate.ventilate.domain.VentDeviceBean;

public interface IVentDeviceDao extends IBaseDao<VentDeviceBean> {
	public List<BaseDevice> getDeviceListByAoJianId(String aoJianId);
}
