package com.hibernate.ventilate.dao;

import java.util.List;
import com.hibernate.base.IBaseDao;
import com.hibernate.ventilate.domain.BaseDevice;
import com.hibernate.ventilate.domain.WindowDeviceBean;

public interface IWindowDeviceDao extends IBaseDao<WindowDeviceBean> {
	public List<BaseDevice> getDeviceListByAoJianId(String aoJianId);
}
