package com.hibernate.sernsorInfo.service;

import java.util.List;

import com.hibernate.base.IBaseService;
import com.hibernate.sernsorInfo.domain.OperateRecordBean;

public interface IOperateRecordService extends IBaseService<OperateRecordBean> {
	
	public List<OperateRecordBean> getOperateRecordByHql(String hql, int pageNo, int pageSize);

	public List<OperateRecordBean> getOperateRecordByPageSize(int total, int pageNo, int pageSize);

	public List<String> getOperateTypeList();

	

}
