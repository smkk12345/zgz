package com.hibernate.sernsorInfo.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.hibernate.sernsorInfo.dao.impl.AoJianDataDaoImpl;
import com.hibernate.sernsorInfo.dao.impl.SensorDataDaoImpl;
import com.hibernate.sernsorInfo.domain.AoJianDataBean;
import com.hibernate.sernsorInfo.domain.SensorDataBean;
import com.hibernate.sernsorInfo.service.IAoJianBlockService;

public class AoJianBlockServiceImpl implements IAoJianBlockService {

	private AoJianDataDaoImpl aoJianDataDao;

	private SensorDataDaoImpl sensorDataDao;

	public void setAoJianDataDao(AoJianDataDaoImpl aoJianDataDao) {
		this.aoJianDataDao = aoJianDataDao;
	}

	public void setSensorDataDao(SensorDataDaoImpl sensorDataDao) {
		this.sensorDataDao = sensorDataDao;
	}

	@Override
	public AoJianDataBean save(AoJianDataBean entity) {
		// TODO Auto-generated method stub
		return aoJianDataDao.save(entity);
	}

	@Override
	public void update(AoJianDataBean entity) {
		// TODO Auto-generated method stub
		aoJianDataDao.update(entity);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		aoJianDataDao.delete(id);
	}

	@Override
	public void deleteList(List<AoJianDataBean> beans) {
		// TODO Auto-generated method stub
		// aoJianDataDao.de
	}

	@Override
	public AoJianDataBean getById(String id) {
		// TODO Auto-generated method stub
		return aoJianDataDao.getById(id);
	}

	@Override
	public List<AoJianDataBean> findAll() {
		// TODO Auto-generated method stub
		return aoJianDataDao.findAll();
	}

	/**
	 * 保存SensorData
	 */
	public void update(SensorDataBean entity) {
		// TODO Auto-generated method stub
		sensorDataDao.update(entity);
	}

	/**
	 * 根据id获取感器数据
	 */
	public SensorDataBean getBySensorDataId(String id) {
		// TODO Auto-generated method stub
		return sensorDataDao.getById(id);
	}

	/**
	 * 获取全部传感器数据
	 */
	public List<SensorDataBean> findAllSensorData() {
		// TODO Auto-generated method stub
		return sensorDataDao.findAll();
	}

	/**
	 * 通过时间和粮食信息获取当前检测数据
	 */
	@Override
	public AoJianDataBean getByGrainIdAndDate(String grainId, Date startDate) {
		// TODO Auto-generated method stub
		return aoJianDataDao.getByGrainIdAndDate(grainId, startDate);
	}

	@Override
	public List<SensorDataBean> getSensorDataList(AoJianDataBean dataBean, String hqlStr, String orderField) {
		// TODO Auto-generated method stub
		return sensorDataDao.getSensorDataList(dataBean, hqlStr, orderField);
	}

	@Override
	public AoJianDataBean getRecentAoJianDataBeanByGrainId(String grainId) {
		// TODO Auto-generated method stub
		return aoJianDataDao.getRecentAoJianDataBeanByGrainId(grainId);
	}

	@Override
	public List<AoJianDataBean> getAoJianDataList(String grainId, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return aoJianDataDao.getAoJianDataList(grainId, startDate, endDate);
	}

	@Override
	public List<SensorDataBean> getRencentSensorDataList(String grainId, String hqlStr, String orderField) {
		AoJianDataBean bean = aoJianDataDao.getRecentAoJianDataBeanByGrainId(grainId);
		return sensorDataDao.getRencentSensorDataList(bean, hqlStr, orderField);
	}

	public List<SensorDataBean> getSensorDataByAojianIdAndOrderIndex(String aojianId, String point) {
		// TODO Auto-generated method stub
		return sensorDataDao.getSensorDataByAojianIdAndOrderIndex(aojianId, point);
	}

	public List<SensorDataBean> getPointSensorDataByAojianIds(ArrayList<String> aojianIds, String point) {
		// TODO Auto-generated method stub
		return sensorDataDao.getPointSensorDataByAojianIds(aojianIds, point);
	}

	@Override
	public void updateSensorData(SensorDataBean sensorData) {
		// TODO Auto-generated method stub
		sensorDataDao.update(sensorData);
	}

	public void batchSave(List list) {
		// TODO Auto-generated method stub
		sensorDataDao.batchSave(list);
	}

	@Override
	public List<AoJianDataBean> getOrderedAoJianDataList(String grainId, String startDate, String endDate, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return aoJianDataDao.getOrderedAoJianDataList(grainId, startDate, endDate,pageNo, pageSize);
	}

	public List<SensorDataBean> getSensorDataByNodate(AoJianDataBean aoJianDataBean, String hqlStr, String nodate, String orderField) {
		// TODO Auto-generated method stub
		return sensorDataDao.getSensorDataByNodate(aoJianDataBean, hqlStr, nodate, orderField);
	}
	public int getTotalNumAoJianData(String grainId, String startDateStr, String endDateStr) {
		// TODO Auto-generated method stub
		return aoJianDataDao.getTotalNumAoJianData(grainId, startDateStr, endDateStr);
	}

	@Override
	public List<Integer> getCableIndexListByAoJianDataId(String aoJianDataId) {
		// TODO Auto-generated method stub
		return sensorDataDao.getCableIndexListByAoJianDataId(aoJianDataId);
	}

	@Override
	public AoJianDataBean getRecentAoJianDataBeanByNothing() {
		// TODO Auto-generated method stub
		return aoJianDataDao.getRecentAoJianDataBeanByNothing();
	}

	@Override
	public void deleteAoJianDataById(String aoJianDataId) {
		// TODO Auto-generated method stub
		try {
			sensorDataDao.deleteSensorDataByAoJianDataId(aoJianDataId);
			aoJianDataDao.delete(aoJianDataId);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int getTotalNumByParam(String grainId, String startDateStr,String endDateStr) {
			
		// TODO Auto-generated method stub
		return aoJianDataDao.getTotalNumByParam(grainId, startDateStr, endDateStr);
	}

	@Override
	public List<AoJianDataBean> getChartAoJianDataList(String grainId, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return aoJianDataDao.getChartAoJianDataList(grainId, startDate, endDate);
	}
}
