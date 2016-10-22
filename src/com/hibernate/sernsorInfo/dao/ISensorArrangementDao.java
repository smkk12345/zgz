package com.hibernate.sernsorInfo.dao;

import java.util.List;
import com.hibernate.base.IBaseDao;
import com.hibernate.sernsorInfo.domain.SensorArrangementBean;
import com.hibernate.sernsorInfo.domain.SensorBean;

public interface ISensorArrangementDao extends IBaseDao<SensorArrangementBean> {
    public List<SensorArrangementBean> getArrangementListByType(String defaultType);
    public List<SensorArrangementBean> getSensorArrangementBySensor(SensorBean sensor);
}
