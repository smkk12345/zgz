package com.hibernate.barnInfo.dao.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;

import com.hibernate.barnInfo.dao.IBarnDao;
import com.hibernate.barnInfo.domain.BarnBean;
import com.hibernate.base.BaseDaoImpl;

public class BarnDaoImpl extends BaseDaoImpl<BarnBean> implements IBarnDao {

    @Override
    public BarnBean save(BarnBean entity) {
        // TODO Auto-generated method stub
        return super.save(entity);
    }

    @Override
    public void update(BarnBean entity) {
        // TODO Auto-generated method stub
        super.update(entity);
    }

 
    @Override
    public BarnBean getById(String id) {
        // TODO Auto-generated method stub
        return super.getById(id);
    }

    @Override
    public List<BarnBean> getByIds(String[] ids) {
        // TODO Auto-generated method stub
        return super.getByIds(ids);
    }

    @Override
    public List<BarnBean> findAll() {
        Session s = null;
        List<BarnBean> list = null;
        try{
            s = getSession();
            list= s.createCriteria(clazz).add(Restrictions.eq("isDel", "0")).addOrder(Order.asc("createTime")).list();
        }
        catch(Exception e){
            e.printStackTrace();
        }finally{
            s.close();
        }
        return list;
    }

    @Override
    public Set<BarnBean> getListByUserId(String id) {
        Session s = getSession();
        Set<BarnBean> set = new HashSet<BarnBean>(); ;
        try {
            
            Criteria barnCriteria = s.createCriteria(BarnBean.class);
            
            Criteria criteria = barnCriteria.add(Restrictions.eq("isDel", "0")).createCriteria("users").add(Restrictions.eq("id", id));
            
            set = new HashSet<BarnBean>(criteria.list());
//			Query q = s.createQuery("select * from BarnBean as c right join  "+StaticSource.T_LQT_USER_BARN+ " as u on c.id = u.barnId  where u.userId = :userId");
//			q.setString("userId", id);
//			set = new HashSet<BarnBean>(q.list());
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            s.close();
        }
        return set;
    }

    @Override
    public List<BarnBean> findListByBarnIndex(String barnIndex) {
        Session s = null;
        List<BarnBean> list = null;
        try{
            s = getSession();
            list= s.createCriteria(clazz).add(Restrictions.eq("isDel", "0"))
                   .add(Restrictions.eq("barnIndex", barnIndex))
                   .list();
        }
        catch(Exception e){
            e.printStackTrace();
        }finally{
            s.close();
        }
        return list;
    }

	@Override
	public void fakeDelateBarnById(String barnId) {
		Session s = null;
		Transaction tx = null;
		try{
			s = getSession();
			tx = s.beginTransaction();
			String hql="update BarnBean set isDel = '1' where id = '"+barnId+"'";
			Query q = s.createQuery(hql);
			q.executeUpdate();
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
	}

}
