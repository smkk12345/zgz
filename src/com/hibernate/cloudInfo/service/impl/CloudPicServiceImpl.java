package com.hibernate.cloudInfo.service.impl;

import java.util.List;
import com.hibernate.cloudInfo.dao.impl.CloudPicDaoImpl;
import com.hibernate.cloudInfo.domain.CloudPicBean;
import com.hibernate.cloudInfo.service.IcloudPicService;

public class CloudPicServiceImpl implements IcloudPicService {

	private CloudPicDaoImpl cloudPicDao;

	public void setCloudPicDao(CloudPicDaoImpl cloudPicDao) {
		this.cloudPicDao = cloudPicDao;
	}

	@Override
	public CloudPicBean save(CloudPicBean entity) {
		// TODO Auto-generated method stub
		return cloudPicDao.save(entity);
	}

	@Override
	public void update(CloudPicBean entity) {
		// TODO Auto-generated method stub
		cloudPicDao.update(entity);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		cloudPicDao.delete(id);
	}

	@Override
	public void deleteList(List<CloudPicBean> beans) {
		// TODO Auto-generated method stub
		cloudPicDao.deleteList(beans);
	}

	@Override
	public CloudPicBean getById(String id) {
		// TODO Auto-generated method stub
		return cloudPicDao.getById(id);
	}

	@Override
	public List<CloudPicBean> findAll() {
		// TODO Auto-generated method stub
		return cloudPicDao.findAll();
	}

	public List<CloudPicBean> getByAoJianDataIdAndYuTuTypeAndSection(String aoJianDataId, int yuTuType, String section) {
		// TODO Auto-generated method stub
		return cloudPicDao.getByAoJianDataIdAndYuTuTypeAndSection(aoJianDataId, yuTuType, section);
	}

	public Integer deleteByAoJianDataId(String lqId) {
		// TODO Auto-generated method stub
		return cloudPicDao.deleteByAoJianDataId(lqId);
	}

	public List<CloudPicBean> getByAoJianDataId(String lqId) {
		// TODO Auto-generated method stub
		return cloudPicDao.getByAoJianDataId(lqId);
	}

	public List<CloudPicBean> getByAoJianDataIdAndYuTuType(String lqId, int yuTuType) {
		// TODO Auto-generated method stub
		return cloudPicDao.getByAoJianDataIdAndYuTuType(lqId, yuTuType);
	}

	
}
