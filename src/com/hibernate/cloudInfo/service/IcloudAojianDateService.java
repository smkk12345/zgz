package com.hibernate.cloudInfo.service;

import java.util.List;

import com.hibernate.base.IBaseService;
import com.hibernate.cloudInfo.domain.CloudAojianDateBean;

public interface IcloudAojianDateService extends IBaseService<CloudAojianDateBean> {

	List<CloudAojianDateBean> getByAoJianDataId(String AoJianDataId);

	
}
