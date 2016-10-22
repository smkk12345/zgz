package com.hibernate.ventilate.service;

import java.util.List;
import com.hibernate.base.IBaseService;
import com.hibernate.ventilate.domain.BaseDevice;
import com.hibernate.ventilate.domain.FanDeviceBean;

public interface IFanDeviceService extends IBaseService<FanDeviceBean> {
	public List<BaseDevice> getDeviceListByAoJianId(String aoJianId);
}
