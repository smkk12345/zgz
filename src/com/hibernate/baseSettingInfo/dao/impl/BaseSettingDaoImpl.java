package com.hibernate.baseSettingInfo.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.hibernate.base.BaseDaoImpl;
import com.hibernate.baseSettingInfo.dao.IBaseSettingDao;
import com.hibernate.baseSettingInfo.domain.BaseSettingBean;

public class BaseSettingDaoImpl extends BaseDaoImpl<BaseSettingBean> implements IBaseSettingDao {

	@Override
	public BaseSettingBean save(BaseSettingBean entity) {
		// TODO Auto-generated method stub
		return super.save(entity);
	}

	
	@Override
	public void update(BaseSettingBean entity) {
		// TODO Auto-generated method stub
		super.update(entity);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		super.delete(id);
	}

	@Override
	public BaseSettingBean getById(String id) {
		// TODO Auto-generated method stub
		return super.getById(id);
	}

	@Override
	public List<BaseSettingBean> getByIds(String[] ids) {
		// TODO Auto-generated method stub
		return super.getByIds(ids);
	}

	@Override
	public List<BaseSettingBean> findAll() {
		// TODO Auto-generated method stub
		return super.findAll();
	}

	
	public BaseSettingBean getBaseSettingBeanByKey(String key) {
		Session s = null;
		BaseSettingBean bs = null;
		try {
			s = getSession();
			Criteria setCriteria = s.createCriteria(BaseSettingBean.class);
			Criteria criteria = setCriteria.add(Restrictions.eq("key", key));
			try {
				bs= (BaseSettingBean) criteria.uniqueResult();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		return bs;
	}

	
}
