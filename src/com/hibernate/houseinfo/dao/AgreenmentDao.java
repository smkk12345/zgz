package com.hibernate.houseinfo.dao;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.hibernate.base.BaseDaoImpl;
import com.hibernate.houseinfo.domain.Agreement;
import com.hibernate.houseinfo.domain.IndexNum;
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

	public Agreement getLeftHouse() {
		Session s = null;
		try{
			s = getSession();
			String sql = "SELECT  SUM(yjs) AS yjs,SUM(ljs70) AS ljs70,SUM(ljs75) AS ljs75,SUM(ljs80) AS ljs80,SUM(ljs85) AS ljs85,SUM(sjs) AS sjs FROM agreenment where protocolnumber is not null and protocolnumber != '' ";
			List<Object[]> list1 = s.createSQLQuery(sql).list();
			
			Object[] arr = list1.get(0);
			Agreement a = new Agreement();
			a.setYjs(Integer.parseInt(arr[0].toString()));
			a.setLjs70(Integer.parseInt(arr[1].toString()));
			a.setLjs75(Integer.parseInt(arr[2].toString()));
			a.setLjs80(Integer.parseInt(arr[3].toString()));
			a.setLjs85(Integer.parseInt(arr[4].toString()));
			a.setSjs(Integer.parseInt(arr[5].toString()));
			return a;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		return null;
	}
	
}
