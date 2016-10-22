package com.hibernate.sernsorInfo.dao;

import java.util.List;
import com.hibernate.base.IBaseDao;
import com.hibernate.sernsorInfo.domain.SensorBean;

public interface ISensorDao extends IBaseDao<SensorBean>{
	public List<SensorBean> getSensorListByType(String type);
}
