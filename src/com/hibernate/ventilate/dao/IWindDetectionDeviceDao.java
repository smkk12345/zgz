package com.hibernate.ventilate.dao;

import java.util.List;
import com.hibernate.base.IBaseDao;
import com.hibernate.ventilate.domain.BaseDevice;
import com.hibernate.ventilate.domain.WindDetectionDeviceBean;

public interface IWindDetectionDeviceDao extends
		IBaseDao<WindDetectionDeviceBean> {
	public List<BaseDevice> getDeviceListByAoJianId(String aoJianId);
}
