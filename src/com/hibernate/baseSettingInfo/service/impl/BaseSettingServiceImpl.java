package com.hibernate.baseSettingInfo.service.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.common.utils.StringUtils;
import com.hibernate.baseSettingInfo.dao.impl.BaseSettingDaoImpl;
import com.hibernate.baseSettingInfo.domain.BaseSettingBean;
import com.hibernate.baseSettingInfo.service.IBaseSettingService;

public class BaseSettingServiceImpl implements IBaseSettingService {

	private BaseSettingDaoImpl dao;

	public void setDao(BaseSettingDaoImpl dao) {
		this.dao = dao;
	}

	@Override
	public BaseSettingBean save(BaseSettingBean entity) {
		// TODO Auto-generated method stub
		return dao.save(entity);
	}

	@Override
	public void update(BaseSettingBean entity) {
		// TODO Auto-generated method stub
		dao.update(entity);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		dao.delete(id);
	}

	@Override
	public void deleteList(List<BaseSettingBean> beans) {
		// TODO Auto-generated method stub
		// dao.deleteList(beans);
	}

	@Override
	public BaseSettingBean getById(String id) {
		// TODO Auto-generated method stub
		return dao.getById(id);
	}

	@Override
	public List<BaseSettingBean> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	public void saveBaseSettingInfo(Map<String, String> map) {
		String key = "";
		String value = "";
		Iterator<String> iter = map.keySet().iterator();
		BaseSettingBean bean;
		while (iter.hasNext()) {
			key = iter.next();
			String[] keyArr = key.split(",");
			value = map.get(key);
			if (!StringUtils.isEmpty(value)) {
				bean = dao.getBaseSettingBeanByKey(keyArr[0]);
				if (null != bean) {
					bean.setValue(value);
					dao.update(bean);
				} else {
					bean = new BaseSettingBean();
					bean.setKey(keyArr[0]);
					bean.setKeyName(keyArr[1]);
					bean.setValue(value);
					dao.save(bean);
				}
			}
		}
	}

	
	public BaseSettingBean findValueByKey(String key) {
		return dao.getBaseSettingBeanByKey(key);
	}

	public void delete() {
		// TODO Auto-generated method stub
//		return dao.delete();
	}

}
