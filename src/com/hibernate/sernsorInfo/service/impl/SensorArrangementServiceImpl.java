package com.hibernate.sernsorInfo.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.common.utils.StringUtils;
import com.hibernate.base.IBaseDao;
import com.hibernate.sernsorInfo.dao.IArrangementDataDao;
import com.hibernate.sernsorInfo.dao.ISensorArrangementDao;
import com.hibernate.sernsorInfo.domain.ArrangementDataBean;
import com.hibernate.sernsorInfo.domain.ExtensionBean;
import com.hibernate.sernsorInfo.domain.SensorArrangementBean;
import com.hibernate.sernsorInfo.domain.SensorBean;
import com.hibernate.sernsorInfo.service.ISensorArrangementService;

public class SensorArrangementServiceImpl implements ISensorArrangementService {

    private ISensorArrangementDao dao;
    private IArrangementDataDao arrangementDao;
    public void setArrangementDao(IArrangementDataDao arrangementDao) {
        this.arrangementDao = arrangementDao;
    }

    public void setDao(ISensorArrangementDao dao) {
        this.dao = dao;
    }

    @Override
    public SensorArrangementBean save(SensorArrangementBean entity) {
        //通过布置信息生成布置数据信息   后续添加
        //private Set<ExtensionBean> extensionBeans;
        //如果 行数 排数 层数发生改变  需要重新生成数据
        if(StringUtils.isEmpty(entity.getId())){
            return dao.save(entity);
        }
        SensorArrangementBean bean = dao.getById(entity.getId());
        if(bean.getRowCount() != entity.getRowCount()||bean.getColumnCount()!=entity.getColumnCount()||bean.getLayerCount()!=entity.getLayerCount()){
            //删掉布置下的数据
            arrangementDao.deleteDataBySensorArrangement(entity);
            //重新生成布置数据
            List<ArrangementDataBean> arrList = arrangementDao.getBeanBySensorArrangementId(entity);
            if(arrList==null||arrList.size()<=0){
                List<ArrangementDataBean> list = new ArrayList<ArrangementDataBean>();
                for (int i = 0; i < entity.getRowCount(); i++) {
                    for (int j = 0; j < entity.getColumnCount(); j++) {
                        for (int k = 0; k < entity.getLayerCount(); k++) {
                            ArrangementDataBean aBean = new ArrangementDataBean();
                            String position = i+","+j+","+k;
                            aBean.setPosition(position);
                            aBean.setIsDelete("1");
                            aBean.setSensorArrangementBean(entity);
        //					aBean.setZyAoJianId(bean.getAoJian().getZyAoJianNum());
                            list.add(aBean);
                        }
                    }
                }
                arrangementDao.batchSave(list);
                dao.update(entity);
            }
        }
        else{
            dao.update(entity);
        }
        return entity;
    }

    @Override
    public void update(SensorArrangementBean entity) {
        // TODO Auto-generated method stub
        dao.update(entity);
    }

    @Override
    public void delete(String id) {
        // TODO Auto-generated method stub
        dao.delete(id);
    }

    @Override
    public void deleteList(List<SensorArrangementBean> beans) {
        // TODO Auto-generated method stub

    }

    @Override
    public SensorArrangementBean getById(String id) {
        // TODO Auto-generated method stub
        return dao.getById(id);
    }

    @Override
    public List<SensorArrangementBean> findAll() {
        // TODO Auto-generated method stub
        return dao.findAll();
    }

    @Override
    public void deleteArrangementDataByArrangement(
            SensorArrangementBean sensorArrangementBean) {
        // TODO Auto-generated method stub
        arrangementDao.deleteDataBySensorArrangement(sensorArrangementBean);
    }

    @Override
    public List<SensorArrangementBean> getArrangementListByType(
            String defaultType) {
        // TODO Auto-generated method stub
        return dao.getArrangementListByType(defaultType);
    }

	@Override
	public void batchSaveArrangementBean(List<ArrangementDataBean> list) {
		// TODO Auto-generated method stub
		arrangementDao.batchSave(list);
	}

	@Override
	public List<SensorArrangementBean> getSensorArrangementBySensor(
			SensorBean sensor) {
		// TODO Auto-generated method stub
		return dao.getSensorArrangementBySensor(sensor);
	}
	
	public List<ArrangementDataBean> getbyAoJianIdAndArrangeId(
			String zyAoJianId, SensorArrangementBean sensorArrangementBean) {
		// TODO Auto-generated method stub
		return arrangementDao.getbyAoJianIdAndArrangeId(zyAoJianId,sensorArrangementBean);
	}
}
