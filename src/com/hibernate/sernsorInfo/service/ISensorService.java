package com.hibernate.sernsorInfo.service;

import java.util.List;

import com.hibernate.base.IBaseService;
import com.hibernate.sernsorInfo.domain.AoJianDataBean;
import com.hibernate.sernsorInfo.domain.SensorBean;
import com.hibernate.sernsorInfo.domain.SensorDataBean;

public interface ISensorService extends IBaseService<SensorBean> {
	public List<SensorBean> getSensorListByType(String type);
}
