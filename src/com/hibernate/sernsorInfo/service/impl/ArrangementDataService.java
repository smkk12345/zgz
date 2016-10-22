package com.hibernate.sernsorInfo.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.hibernate.sernsorInfo.dao.impl.ArrangementDataDaoImpl;
import com.hibernate.sernsorInfo.dao.impl.SensorArrangementDaoImpl;
import com.hibernate.sernsorInfo.domain.ArrangementDataBean;
import com.hibernate.sernsorInfo.domain.SensorArrangementBean;
import com.hibernate.sernsorInfo.service.IArrangementDataService;

public class ArrangementDataService implements IArrangementDataService {

	private ArrangementDataDaoImpl dao;
	private SensorArrangementDaoImpl sensorArrangementdao;
	public void setSensorArrangementdao(
			SensorArrangementDaoImpl sensorArrangementdao) {
		this.sensorArrangementdao = sensorArrangementdao;
	}

	public void setDao(ArrangementDataDaoImpl dao) {
		this.dao = dao;
	}

	@Override
	public ArrangementDataBean save(ArrangementDataBean entity) {
		// TODO Auto-generated method stub
		return dao.save(entity);
	}

	@Override
	public void update(ArrangementDataBean entity) {
		// TODO Auto-generated method stub
		dao.update(entity);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		dao.delete(id);
	}

	@Override
	public void deleteList(List<ArrangementDataBean> beans) {
		// TODO Auto-generated method stub
//		dao.deleteL()
	}

	@Override
	public ArrangementDataBean getById(String id) {
		// TODO Auto-generated method stub
		return dao.getById(id);
	}

	@Override
	public List<ArrangementDataBean> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public void batchSave(List<ArrangementDataBean> list) {
		// TODO Auto-generated method stub
		dao.batchSave(list);
	}

	@Override
	public List<ArrangementDataBean> getbyAoJianId(String zyAoJianId) {
		// TODO Auto-generated method stub
		return dao.getbyAoJianId(zyAoJianId);
	}
	/**
	 * 删除缆线数据
	 */
	@Override
	public void deleteBeanByPosition(String strPos,SensorArrangementBean bean) {
		// TODO Auto-generated method stub
		bean = sensorArrangementdao.getById(bean.getId());
		dao.deleteBeanByPosition(strPos,bean);
	}

	@Override
	public List<ArrangementDataBean> getDeleteBeanById(String id) {
		// TODO Auto-generated method stub
		SensorArrangementBean bean = sensorArrangementdao.getById(id);
		return dao.getDeleteBeanById(bean);
	}

	@Override
	public void addBeanByPosition(String strPos,SensorArrangementBean bean) {
		bean = sensorArrangementdao.getById(bean.getId());
		dao.addBeanByPosition(strPos,bean);
	}

	@Override
	public List<ArrangementDataBean> getbyAoJianIdAndArrangeId(
			String zyAoJianId, SensorArrangementBean sensorArrangementBean) {
		// TODO Auto-generated method stub
		return dao.getbyAoJianIdAndArrangeId(zyAoJianId,sensorArrangementBean);
	}

	@Override
	public void clearSensorArrangementInfo(String id) {
		// TODO Auto-generated method stub
		dao.clearSensorArrangementInfo(id);
	}



}
