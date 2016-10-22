package com.hibernate.baseSettingInfo.dao;

import java.util.Map;

import com.hibernate.base.IBaseDao;
import com.hibernate.baseSettingInfo.domain.BaseSettingBean;

public interface IBaseSettingDao extends IBaseDao<BaseSettingBean> {

	public BaseSettingBean getBaseSettingBeanByKey(String key);

}
