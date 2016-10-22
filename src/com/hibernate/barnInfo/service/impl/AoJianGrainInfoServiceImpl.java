package com.hibernate.barnInfo.service.impl;

import java.util.List;

import com.hibernate.barnInfo.dao.IAoJianGrainInfoBeanDao;
import com.hibernate.barnInfo.dao.impl.AoJianGrainInfoDaoImpl;
import com.hibernate.barnInfo.domain.AoJianGrainInfoBean;

public class AoJianGrainInfoServiceImpl implements IAoJianGrainInfoBeanDao {

	private AoJianGrainInfoDaoImpl dao;

	public void setDao(AoJianGrainInfoDaoImpl dao) {
		this.dao = dao;
	}

	@Override
	public AoJianGrainInfoBean save(AoJianGrainInfoBean entity) {
		return dao.save(entity);
	}

	@Override
	public void update(AoJianGrainInfoBean entity) {
		dao.update(entity);
	}

	@Override
	public void delete(String id) {
		dao.delete(id);
	}

	@Override
	public void deleteList(List<AoJianGrainInfoBean> beans) {
		dao.deleteList(beans);
	}

	@Override
	public AoJianGrainInfoBean getById(String id) {
		return dao.getById(id);
	}

	@Override
	public List<AoJianGrainInfoBean> findAll() {
		return dao.findAll();
	}
	
	//根据zyAoJianNum获取记录
	public List<AoJianGrainInfoBean> getByZyAoJianNum(String zyAoJianNum) {
		return dao.getByZyAoJianNum(zyAoJianNum);
	}
	
}
