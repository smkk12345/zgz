package com.hibernate.houseinfo.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.hibernate.base.BaseDaoImpl;
import com.hibernate.houseinfo.domain.HouseBasic;
import com.hibernate.userInfo.damain.User;

public class HouseBasicDao extends BaseDaoImpl<HouseBasic> {
	
	/**
	 * 通过id和标段获取数据
	 * @param id
	 * @param section
	 * @return
	 */
	public HouseBasic findById(String id,String section) {
		Session s = null;
		List<HouseBasic> list = null;
		try{
			s = getSession();
			list = s.createCriteria(HouseBasic.class).add(
					Restrictions.eq("id", id))
					.add(Restrictions.in("section", section.split(","))).list();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		if(null != list && list.size()>0){
			return list.get(0);
		}
		return null;
	};
	
	/**
	 * 获取列表信息  带分页 带排序字段 
	 */
	public List<HouseBasic> findList(String section,int pageSize,int currentPage){
		List<HouseBasic> list = null;
		Session s = null;
		try{
			s = getSession();
			Criteria c = s.createCriteria(HouseBasic.class);
			if(pageSize>0){
				c.setFirstResult((pageSize)*(currentPage-1));
				c.setMaxResults(pageSize);
			}
			list = c.add(Restrictions.in("section", section.split(","))).list();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		return list;
	}

	public List<HouseBasic> getListBySection(String section, int currentpage,
			int pagecount) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
