package com.hibernate.houseinfo.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.hibernate.base.BaseDaoImpl;
import com.hibernate.houseinfo.domain.OtherInfo;
import com.hibernate.houseinfo.domain.VacatePeople;

public class VacatePeopleDao extends BaseDaoImpl<VacatePeople> {
	
	public List<VacatePeople> findList(String housebasicid,String vtype){
		List<VacatePeople> list = null;
		Session s = null;
		try{
			s = getSession();
			Criteria c = s.createCriteria(VacatePeople.class);
			list = c.add(Restrictions.eq("housebasicid", housebasicid))
					.add(Restrictions.eq("vtype", vtype))
					.addOrder(Order.asc("createTime"))
					.list();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		return list;
	}
	
	public boolean batchSave(List<VacatePeople> list){
		try {
//			Session session =  getSession();
//			Transaction tx = session.beginTransaction();
			for(int i=0;i<list.size();i++){
				VacatePeople vacatePeople = list.get(i);
			    save(vacatePeople);
//			    if(i%25==0){//以每25个数据作为一个处理单元
//			        session.flush();
//			        session.clear();
//			    }
			}
//			tx.commit(); 
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
