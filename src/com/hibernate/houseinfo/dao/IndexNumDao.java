package com.hibernate.houseinfo.dao;

import java.sql.Statement;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.hibernate.base.BaseDaoImpl;
import com.hibernate.houseinfo.domain.AzNumBean;
import com.hibernate.houseinfo.domain.HbNumBean;
import com.hibernate.houseinfo.domain.IndexNum;

public class IndexNumDao extends BaseDaoImpl<IndexNum> {

	public IndexNum getByBasicId(String housebasicid) {
		Session s = null;
		List<IndexNum> list = null;
		try{
			s = getSession();
			list = s.createCriteria(IndexNum.class).add(
					Restrictions.eq("housebasicid", housebasicid)).list();
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
	
	public boolean clearIndexNum() {
		Session s = null;
		try{
			s = getSession();
			String sql="delete from indexnum"; 
			Transaction tr = s .beginTransaction();
			//获取connection,执行静态SQL
			Statement state = s.connection().createStatement();
			state.executeQuery(sql);
			tr.commit(); 
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
			s.close();
		}
		return true;
	}

	public List<IndexNum> getList(int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		List<IndexNum> list = null;
		Session s = null;
		try{
			s = getSession();
			Criteria c = s.createCriteria(IndexNum.class);
			if(pageSize>0){
				c.setFirstResult((pageSize)*(currentPage-1));
				c.setMaxResults(pageSize);
			}
			list = c.addOrder(Order.asc("indexnum")).list();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		return list;
	}
	
	public HbNumBean saveHb(){
		HbNumBean h = new HbNumBean();
		h.setCreateTime(new Date());
		h.setUpdateTime(new Date());
		Session s = null;
		Transaction tx = null;
		try{
			s = getSession();
			tx = s.beginTransaction();
			s.save(h);
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		return h;
	}
	
	public AzNumBean saveAz(){
		AzNumBean h = new AzNumBean();
		h.setCreateTime(new Date());
		h.setUpdateTime(new Date());
		Session s = null;
		Transaction tx = null;
		try{
			s = getSession();
			tx = s.beginTransaction();
			s.save(h);
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		return h;
	}
	
}
