package com.hibernate.houseinfo.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.ui.ModelMap;

import com.common.utils.StringUtils;
import com.hibernate.base.BaseDaoImpl;
import com.hibernate.houseinfo.domain.HouseBasic;
import com.hibernate.userInfo.damain.User;

public class HouseBasicDao extends BaseDaoImpl<HouseBasic> {
	
	/**
	 * 通过id和标段获取数据
	 * @param id
	 * 
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
	public List<HouseBasic> findList(HttpServletRequest request,ModelMap model,String section,int pageSize,int currentPage){
		List<HouseBasic> list = null;
			// TODO Auto-generated method stub
		Session s = null;
		try{
			s = getSession();
			Criteria c = s.createCriteria(HouseBasic.class);
			c.setFirstResult(pageSize);
			c.setMaxResults(currentPage);
			String location = request.getParameter("location");
			String names = request.getParameter("names");
			String  mobile = request.getParameter("mobile");
			String idcard = request.getParameter("idcard");
			StringBuffer sb = new StringBuffer();
			if(!StringUtils.isBlank(location)){
				c.add(Restrictions.like("location", location,MatchMode.ANYWHERE));
				model.addAttribute("location", location);
			}
			if(!StringUtils.isBlank(names)){
				c.add(Restrictions.like("names", names,MatchMode.ANYWHERE));
				model.addAttribute("names", names);
			}
			if(!StringUtils.isBlank(mobile)){
				c.add(Restrictions.eq("mobile", mobile));
				model.addAttribute("mobile", mobile);
			}
			if(!StringUtils.isBlank(idcard)){
				c.add(Restrictions.eq("idcard", idcard));
				model.addAttribute("idcard", idcard);
			}
			list = c.add(Restrictions.in("section", section.split(","))).addOrder(Order.asc("createTime")).list();
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

	public Integer getCount(String section) {
		Session s = null;
		try{
			s = getSession();
			String hql = "select count(id) as count from HouseBasic hb where section in ("+section+")";
			Query query = s.createQuery(hql);
			int count = ((Number) query.iterate().next()).intValue();
			return count;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		return 0;
	}
	
	
}
