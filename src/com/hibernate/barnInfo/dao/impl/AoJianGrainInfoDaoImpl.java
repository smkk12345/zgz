package com.hibernate.barnInfo.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.hibernate.barnInfo.dao.IAoJianGrainInfoBeanDao;
import com.hibernate.barnInfo.domain.AoJianGrainInfoBean;
import com.hibernate.base.BaseDaoImpl;
import com.hibernate.cloudInfo.domain.CloudPicBean;

public class AoJianGrainInfoDaoImpl extends BaseDaoImpl<AoJianGrainInfoBean> implements
		IAoJianGrainInfoBeanDao {

	
	@Override
	public AoJianGrainInfoBean save(AoJianGrainInfoBean entity) {
		// TODO Auto-generated method stub
		return super.save(entity);
	}

	@Override
	public void update(AoJianGrainInfoBean entity) {
		// TODO Auto-generated method stub
		super.update(entity);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		super.delete(id);
	}

	@Override
	public AoJianGrainInfoBean getById(String id) {
		// TODO Auto-generated method stub
		return super.getById(id);
	}

	@Override
	public List<AoJianGrainInfoBean> getByIds(String[] ids) {
		// TODO Auto-generated method stub
		return super.getByIds(ids);
	}

	@Override
	public List<AoJianGrainInfoBean> findAll() {
		// TODO Auto-generated method stub
		return super.findAll();
	}
	
	@Override
	public void deleteList(List<AoJianGrainInfoBean> beans) {
		// TODO Auto-generated method stub
	}

	public List<AoJianGrainInfoBean> getByZyAoJianNum(String zyAoJianNum) {
		// TODO Auto-generated method stub
		Session s = null;
		List<AoJianGrainInfoBean> list = new ArrayList<AoJianGrainInfoBean>();
		try {
			s = getSession();
			list = s.createCriteria(clazz).add(Restrictions.eq("zyAoJianNum", zyAoJianNum)).list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			s.close();
		}
		return list;
	}
	
	

}
