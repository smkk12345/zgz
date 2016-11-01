package com.hibernate.houseinfo.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.impl.SQLQueryImpl;
import org.springframework.jdbc.object.SqlQuery;
import org.springframework.ui.ModelMap;

import com.common.utils.StringUtils;
import com.hibernate.base.BaseDaoImpl;
import com.hibernate.houseinfo.domain.DisplayBean;
import com.hibernate.houseinfo.domain.HouseBasic;
import com.hibernate.houseinfo.domain.IndexNum;
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
			String atype = request.getParameter("atype");
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
		// TODO Auto-generated method stub  s.createSQLQuery()
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
	
	/**
	 * 例子 处理直接查库联查  后续统计问题
	 * @param section
	 * @return
	 */
	public Integer getCount1(String section) {
		// TODO Auto-generated method stub  s.createSQLQuery()
		Session s = null;
		try{
			s = getSession();
			List<Object> list = s.createSQLQuery("select a.*,b.* from housebasic a left join agreenment b on a.id = b.housebasicid ").list();
			System.out.println(list);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		return 0;
	}
	
	
	/**
	 * 所有的统计查询都需要连表查询，怎么简单怎么来了
	 */
	public List<IndexNum> getIndexNumList(String section, int currentpage,int pagecount){
			
		Session s = null;
		try{
			s = getSession();
			StringBuffer sb = new StringBuffer();
			sb.append(" select a.*,b.section,b.names from indexnum a "
					+ "left join housebasic b on a.housebasicid = a.id where 1=1 ");
			if(!StringUtils.isBlank(section)){
				sb.append(" and b.section =  '").append(section).append("'");
			}
			sb.append(" order by a.id asc ");
			sb.append(" LIMIT ").append(currentpage*pagecount).append(",").append(pagecount);
			List<IndexNum> list = s.createSQLQuery(sb.toString()).addEntity(IndexNum.class).list();
			return list;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		return null;
	}

	/**
	 * 写一个查询搞定所有的数据算了
	 */
	public List<DisplayBean> getDisplayBeanList(String sql, 
			int currentpage,int pagecount){
		Session s = null;
		try{
			s = getSession();
			StringBuffer sb = new StringBuffer();
			sb.append(" select a.*,a.id as housebasicid, "
					+ "b.*,b.id as agreenmentid,c.*,c.id as indexid from housebasic a "
					+ "left join agreenment b on a.id = b.housebasicid "
					+ "left join indexnum c on a.id = c.housebasicid "
					+ " where 1=1 ");
			if(!StringUtils.isBlank(sql)){
				sb.append(sql);
			}
			sb.append(" order by c.indexnum asc ");
			sb.append(" LIMIT ").append(currentpage*pagecount).append(",").append(pagecount);
			List<DisplayBean> list = s.createSQLQuery(sb.toString()).addEntity(DisplayBean.class).list();
			return list;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		return null;
	}

	public Integer getDisPlayCount(String sql) {
		Session s = null;
		try{
			s = getSession();
			StringBuffer sb = new StringBuffer();
			sb.append(" select count(a.id) as count "
					+ " from housebasic a "
					+ "left join agreenment b on a.id = b.housebasicid "
					+ "left join indexnum c on a.id = c.housebasicid "
					+ " where 1=1 ");
			if(!StringUtils.isBlank(sql)){
				sb.append(sql);
			}
			SQLQuery query = s.createSQLQuery(sb.toString());
			Object o = query.uniqueResult();
			return ((Number)o).intValue();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		return 0;
	}
	
}
