package com.hibernate.barnInfo.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.common.utils.StringUtils;
import com.hibernate.barnInfo.dao.impl.AoJianDaoImpl;
import com.hibernate.barnInfo.dao.impl.BarnDaoImpl;
import com.hibernate.barnInfo.domain.AoJianBean;
import com.hibernate.barnInfo.domain.BarnBean;
import com.hibernate.barnInfo.service.IBarnService;
import com.hibernate.base.IBaseService;

public class BarnServiceImpl implements IBarnService, IBaseService<BarnBean> {

    private BarnDaoImpl barnDao;
    private AoJianDaoImpl aoJianDao;

    public void setAoJianDao(AoJianDaoImpl aoJianDao) {
        this.aoJianDao = aoJianDao;
    }

    public void setBarnDao(BarnDaoImpl barnDao) {
        this.barnDao = barnDao;
    }

    @Override
    public BarnBean save(BarnBean entity) {
        if ("".equals(entity.getId()) || entity.getId() == null) {
            return barnDao.save(entity);
        } else {
            barnDao.update(entity);
        }
        return entity;
    }

    @Override
    public void update(BarnBean entity) {
        barnDao.update(entity);
    }

    @Override
    public void delete(String id) {
        barnDao.delete(id);
    }

    @Override
    public void deleteList(List<BarnBean> beans) {

    }

    @Override
    public BarnBean getById(String id) {
        return barnDao.getById(id);
    }

    @Override
    public List<BarnBean> findAll() {
        List<BarnBean> list = barnDao.findAll();
        // for (int i = 0; i < list.size(); i++) {
        // BarnBean bean = list.get(i);
        // bean.setAoJianSet(findListByBarn(bean));
        // }
        return list;
    }

    @Override
    public List<AoJianBean> findListByBarn(BarnBean barn) {
        return aoJianDao.findListByBarn(barn);
    }

    @Override
    public List<BarnBean> findListByBarnIndex(String barnIndex) {
        // TODO Auto-generated method stub
        return barnDao.findListByBarnIndex(barnIndex);
    }

	@Override
	public List<BarnBean> getBarnListWithArrangement() {
		List<BarnBean> allBarn = barnDao.findAll();
		List<BarnBean> result = new ArrayList<BarnBean>();
		for (int i = 0; i < allBarn.size(); i++) {
			Set<AoJianBean> aoJianSet = allBarn.get(i).getAoJianSet();
			Iterator<AoJianBean> it = aoJianSet.iterator();
			while (it.hasNext()) {
				AoJianBean aoJian = it.next();
				if(!StringUtils.isEmpty(aoJian.getSensorArrangementbeanId())){
					result.add(allBarn.get(i));
					break;
				}
			}
		}
		return result;
	}

	@Override
	public void fakeDelateBarnById(String barnId) {
		// TODO Auto-generated method stub
		barnDao.fakeDelateBarnById(barnId);
	}
}
