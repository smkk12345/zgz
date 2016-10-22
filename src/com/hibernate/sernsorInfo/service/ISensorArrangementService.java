package com.hibernate.sernsorInfo.service;

import java.util.List;

import com.hibernate.base.IBaseService;
import com.hibernate.sernsorInfo.domain.ArrangementDataBean;
import com.hibernate.sernsorInfo.domain.SensorArrangementBean;
import com.hibernate.sernsorInfo.domain.SensorBean;

public interface ISensorArrangementService extends IBaseService<SensorArrangementBean> {
    public void deleteArrangementDataByArrangement(SensorArrangementBean sensorArrangementBean);
    
    public List<SensorArrangementBean> getArrangementListByType(String defaultType);
    
    public void batchSaveArrangementBean(List<ArrangementDataBean> list);
    
    public List<SensorArrangementBean> getSensorArrangementBySensor(SensorBean sensor);
}
