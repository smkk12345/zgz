package com.hibernate.sernsorInfo.service.impl;

import java.util.List;

import com.hibernate.base.IBaseService;
import com.hibernate.sernsorInfo.dao.IOperateRecordDao;
import com.hibernate.sernsorInfo.domain.OperateRecordBean;
import com.hibernate.sernsorInfo.service.IOperateRecordService;

public class OperateRecordServiceImpl implements IOperateRecordService {

	private IOperateRecordDao dao;

	public void setDao(IOperateRecordDao dao) {
		this.dao = dao;
	}

	@Override
	public OperateRecordBean save(OperateRecordBean entity) {
		// TODO Auto-generated method stub
		return dao.save(entity);
	}

	@Override
	public void update(OperateRecordBean entity) {
		// TODO Auto-generated method stub
		dao.update(entity);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		dao.delete(id);
	}

	@Override
	public void deleteList(List<OperateRecordBean> beans) {
		// TODO Auto-generated method stub
		// dao.de
	}

	@Override
	public OperateRecordBean getById(String id) {
		// TODO Auto-generated method stub
		return dao.getById(id);
	}

	@Override
	public List<OperateRecordBean> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public List<OperateRecordBean> getOperateRecordByHql(String hql, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return dao.getOperateRecordByHql(hql, pageNo, pageSize);
	}

	@Override
	public List<OperateRecordBean> getOperateRecordByPageSize(int total, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return dao.getOperateRecordByPageSize(total, pageNo, pageSize);
	}

	@Override
	public List<String> getOperateTypeList() {
		// TODO Auto-generated method stub
		return dao.getOperateTypeList();
	}

	public int getTotalNumByHql(String hql) {
		// TODO Auto-generated method stub
		return dao.getTotalNumByHql(hql);
	}

}
