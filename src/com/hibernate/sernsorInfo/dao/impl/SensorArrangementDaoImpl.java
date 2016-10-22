package com.hibernate.sernsorInfo.dao.impl;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.common.utils.StringUtils;
import com.hibernate.base.BaseDaoImpl;
import com.hibernate.sernsorInfo.dao.ISensorArrangementDao;
import com.hibernate.sernsorInfo.domain.SensorArrangementBean;
import com.hibernate.sernsorInfo.domain.SensorBean;

public class SensorArrangementDaoImpl extends BaseDaoImpl<SensorArrangementBean> implements
        ISensorArrangementDao {

    @Override
    public SensorArrangementBean save(SensorArrangementBean entity) {
        return super.save(entity);
    }

    @Override
    public void update(SensorArrangementBean entity) {
        super.update(entity);
    }

    @Override
    public void delete(String id) {
        // TODO Auto-generated method stub
        super.delete(id);
    }

    @Override
    public SensorArrangementBean getById(String id) {
        // TODO Auto-generated method stub
        return super.getById(id);
    }

    @Override
    public List<SensorArrangementBean> getByIds(String[] ids) {
        // TODO Auto-generated method stub
        return super.getByIds(ids);
    }

    @Override
    public List<SensorArrangementBean> findAll() {
     Session s = null;
     List<SensorArrangementBean> list = new ArrayList<SensorArrangementBean>();
     try {
      s = getSession();
      list = s.createCriteria(clazz).addOrder(Order.asc("createTime")).list();
     } catch (Exception e) {
      e.printStackTrace();
     } finally {
      s.close();
     }
     return list;
    }

    @Override
    public List<SensorArrangementBean> getArrangementListByType(String defaultType){
        List<SensorArrangementBean> list = new ArrayList<SensorArrangementBean>();
        Session s = null;
        try {
            s = super.getSession();
            if(!StringUtils.isEmpty(defaultType)){ 
            	list = (List<SensorArrangementBean>) s.createCriteria(clazz).add(Restrictions.eq("defaultType", defaultType)).list();
            }else {
            	list = (List<SensorArrangementBean>) s.createCriteria(clazz).list();
			}
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            s.close();
        }
        return list;
    }

	@Override
	public List<SensorArrangementBean> getSensorArrangementBySensor(
			SensorBean sensor) {
        List<SensorArrangementBean> list = new ArrayList<SensorArrangementBean>();
        Session s = null;
        try {
            s = super.getSession();
            list = (List<SensorArrangementBean>) s.createCriteria(clazz).add(Restrictions.eq("sensor", sensor)).list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            s.close();
        }
        return list;
	}

}
