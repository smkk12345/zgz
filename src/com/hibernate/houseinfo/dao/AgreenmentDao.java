package com.hibernate.houseinfo.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.hibernate.base.BaseDaoImpl;
import com.hibernate.houseinfo.domain.Agreement;
import com.hibernate.houseinfo.domain.OtherInfo;

public class AgreenmentDao extends BaseDaoImpl<Agreement> {

	public Agreement getByHouseBasicId(String id) {
		// TODO Auto-generated method stub
		List<Agreement> list = null;
		Session s = null;
		try{
			s = getSession();
			
			Criteria c = s.createCriteria(Agreement.class);
			list = c.add(Restrictions.eq("housebasicid", id))
					.addOrder(Order.asc("updateTime"))
					.list();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		if(null != list && list.size()>0){
			return list.get(0);
		}
		return null;
	}
	
}
