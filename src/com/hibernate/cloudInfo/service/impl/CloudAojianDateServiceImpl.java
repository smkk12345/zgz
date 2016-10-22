package com.hibernate.cloudInfo.service.impl;

import java.util.List;

import com.hibernate.cloudInfo.dao.impl.CloudAojianDateDaoImpl;
import com.hibernate.cloudInfo.domain.CloudAojianDateBean;
import com.hibernate.cloudInfo.service.IcloudAojianDateService;

public class CloudAojianDateServiceImpl implements IcloudAojianDateService {

	private CloudAojianDateDaoImpl cloudAojianDateDao;

	public CloudAojianDateDaoImpl getCloudAojianDateDao() {
		return cloudAojianDateDao;
	}

	public void setCloudAojianDateDao(CloudAojianDateDaoImpl cloudAojianDateDao) {
		this.cloudAojianDateDao = cloudAojianDateDao;
	}

	@Override
	public CloudAojianDateBean save(CloudAojianDateBean entity) {
		// TODO Auto-generated method stub
		return cloudAojianDateDao.save(entity);
	}

	@Override
	public void update(CloudAojianDateBean entity) {
		// TODO Auto-generated method stub
		cloudAojianDateDao.update(entity);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		cloudAojianDateDao.delete(id);
	}

	@Override
	public void deleteList(List<CloudAojianDateBean> beans) {
		// TODO Auto-generated method stub
		cloudAojianDateDao.deleteList(beans);
	}

	@Override
	public CloudAojianDateBean getById(String id) {
		// TODO Auto-generated method stub
		return cloudAojianDateDao.getById(id);
	}

	@Override
	public List<CloudAojianDateBean> getByAoJianDataId(String AoJianDataId) {
		// TODO Auto-generated method stub
		return cloudAojianDateDao.getByAoJianDataId(AoJianDataId);
	}

	@Override
	public List<CloudAojianDateBean> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<CloudAojianDateBean> getByZyAoJianGrainNum(String id, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return cloudAojianDateDao.getByZyAoJianGrainNum(id, pageNo, pageSize);
	}

	public Integer getTotalNumByGrainNum(String id) {
		// TODO Auto-generated method stub
		return cloudAojianDateDao.getTotalNumByGrainNum(id);
	}

	public void deleteByAoJianDataId(String lqId) {
		// TODO Auto-generated method stub
		cloudAojianDateDao.deleteByAoJianDataId(lqId);
	}

}
