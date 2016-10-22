package com.hibernate.ventilate.service;

import java.util.List;
import com.hibernate.base.IBaseService;
import com.hibernate.ventilate.domain.BaseDevice;
import com.hibernate.ventilate.domain.WindDetectionDeviceBean;

public interface IWindDetectionDeviceService extends IBaseService<WindDetectionDeviceBean> {
	public List<BaseDevice> getDeviceListByAoJianId(String aoJianId);
}
