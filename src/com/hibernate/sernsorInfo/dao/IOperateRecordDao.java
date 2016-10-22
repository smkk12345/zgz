package com.hibernate.sernsorInfo.dao;

import java.util.List;

import com.hibernate.base.IBaseDao;
import com.hibernate.sernsorInfo.domain.OperateRecordBean;

public interface IOperateRecordDao extends IBaseDao<OperateRecordBean> {
	public List<OperateRecordBean> getOperateRecordByHql(String hql, int pageNo, int pageSize);

	public List<OperateRecordBean> getOperateRecordByPageSize(int total, int pageNo, int pageSize);

	public List<String> getOperateTypeList();

	public int getTotalNumByHql(String hql);
}
