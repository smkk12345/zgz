package com.hibernate.barnInfo.dao.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.common.utils.GenerateSequenceUtil;
import com.hibernate.barnInfo.dao.IAoJianDao;
import com.hibernate.barnInfo.domain.AoJianBean;
import com.hibernate.barnInfo.domain.BarnBean;
import com.hibernate.base.BaseDaoImpl;

public class AoJianDaoImpl extends BaseDaoImpl<AoJianBean> implements IAoJianDao {

    @Override
    public AoJianBean save(AoJianBean entity) {
        return super.save(entity);
    }

    @Override
    public void update(AoJianBean entity) {
        super.update(entity);
    }

    @Override
    public void delete(String id) {
        super.delete(id);
    }

    @Override
    public AoJianBean getById(String id) {
        List<AoJianBean> list = new ArrayList<AoJianBean>();
        Session s = null;
        try {
            s = super.getSession();
            list = (List<AoJianBean>)s.createCriteria(clazz).add(Restrictions.eq("zyAoJianNum", id)).list();
        } catch (Exception e) {
            // TODO: handle exception
        }finally{
            s.close();
        }
        if(list.size()>0){
            return list.get(0);
        }
        else return null;
    }

    @Override
    public List<AoJianBean> getByIds(String[] ids) {
        return super.getByIds(ids);
    }

    @Override
    public List<AoJianBean> findAll() {
        return super.findAll();
    }

    @Override
    public List<AoJianBean> findListByBarn(BarnBean barn) {
        List<AoJianBean> list = new ArrayList<AoJianBean>();
        Session s = null;
        try {
            s = super.getSession();
            list = s.createCriteria(AoJianBean.class).add(Restrictions.eq("barn", barn)).list();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            s.close();
        }
        
        return list;
    }

    @Override
    public void saveList(Set<AoJianBean> set) {
        Iterator<AoJianBean> it = set.iterator();
        while(it.hasNext()){
            AoJianBean entity = it.next();
            entity.setZyAoJianNum(GenerateSequenceUtil.generateSequenceNo());
            this.save(entity);
        }
    }

    @Override
    public void updateList(Set<AoJianBean> set) {
        Iterator<AoJianBean> it = set.iterator();
        while(it.hasNext()){
            this.update(it.next());
        }
    }
    
    private Set<AoJianBean> ArrayCollectionToList(Set<AoJianBean> set){
        Set<AoJianBean> beans = new HashSet<AoJianBean>();
//		for (int i = 0; i < set.size(); i++) {
//			beans.add(set.);
//		}
        return beans;
    }
    /**
     * 清除廒间布置信息
     */
    @Override
    public void clearSensorArrangementInfo(String sensorArrangementId) {
        
        Session s = null;
        Transaction tx = null;
        try{
//			String hql = "update AoJianBean set sensorArrangementbeanId='' where sensorArrangementbeanId='"+sensorArrangementId+"'";
            s = getSession();
            tx = s.beginTransaction();
            try {
                Query query = s.getNamedQuery("delSensorArrangeInfo");
                query.setString("sensorArrangementId", sensorArrangementId);
                int count = query.executeUpdate();
            } catch (HibernateException e) {
                e.printStackTrace();
            }
//			Query query = s.createQuery(hql);
            tx.commit();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            s.close();
        }
    }

    @Override
    public AoJianBean getByBaseId(String id) {
        // TODO Auto-generated method stub
        return super.getById(id);
    }

    @Override
    public List<AoJianBean> getAoJianByArrangementId(String arrangeId) {
        List<AoJianBean> list = new ArrayList<AoJianBean>();
        Session s = null;
        try {
            s = super.getSession();
            list = (List<AoJianBean>)s.createCriteria(clazz).add(Restrictions.eq("sensorArrangementbeanId", arrangeId)).list();
        } catch (Exception e) {
            // TODO: handle exception
        }finally{
            s.close();
        }
        return list;
    }
    /**
    * @名称: findValidateAoJianList 
    * @日期：2015-10-12 下午1:44:54
    * @作者： lxb
    * @描述: 获取合法的廒间列表，合法标志------grainStatus是1 --sensorArrangementbeanId不能为空
    * @参数 @return    
    * @返回值 List<AoJianBean>    
    * @异常
     */
	@Override
	public List<AoJianBean> findValidateAoJianList() {
        List<AoJianBean> list = new ArrayList<AoJianBean>();
        Session s = null;
        try {
            s = super.getSession();
            list = (List<AoJianBean>)s.createCriteria(clazz).add(Restrictions.eq("grainStatus", "1")).add(Restrictions.isNotNull("sensorArrangementbeanId")).list();
        } catch (Exception e) {
           e.printStackTrace();
        }finally{
            s.close();
        }
        return list;
	}

}
