package com.hibernate.ventilate.service;

import java.util.List;
import com.hibernate.base.IBaseService;
import com.hibernate.ventilate.domain.BaseDevice;
import com.hibernate.ventilate.domain.WindowDeviceBean;

public interface IWindowDeviceService extends IBaseService<WindowDeviceBean> {
	public List<BaseDevice> getDeviceListByAoJianId(String aoJianId);
}
