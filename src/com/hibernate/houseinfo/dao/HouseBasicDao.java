package com.hibernate.houseinfo.dao;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.hibernate.houseinfo.domain.VacatePeople;
import com.hibernate.userInfo.damain.User;
import com.hibernate.utils.SortUtils;

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
			String checkresult = request.getParameter("checkresult");
			
			model.addAttribute("location", location);
			StringBuffer sb = new StringBuffer();
			if(!StringUtils.isBlank(checkresult)){
				model.addAttribute("checkresult", checkresult);
				c.add(Restrictions.eq("checkresult", checkresult));
			}
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
			
			
			list = c.add(Restrictions.in("section", section.split(","))).addOrder(Order.asc("sortnum")).list();
//			list = c.list();
//			for (int i = 0; i < list.size(); i++) {
//				HouseBasic housebasic = list.get(i);
//				if(i%2==0){
//					housebasic.setSection("2");
//				}else{
//					housebasic.setSection("1");
//				}
//				update(housebasic);
//			}
//			updateSortNum();
					}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		return list;
	}


	private void updateSortNum(){
		List<HouseBasic> list = null;
		// TODO Auto-generated method stub
		Session s = null;
		try {
			
		
			s = getSession();
			Criteria c = s.createCriteria(HouseBasic.class);
			list = c.list();
			for (int i = 0; i < list.size(); i++) {
				HouseBasic  housebasic = list.get(i);
				String sectionindex = housebasic.getSectionindex();
				try{
				int nIndex = SortUtils.getSortNum(sectionindex);
				housebasic.setSortnum(nIndex);
				System.out.println(nIndex);
				update(housebasic);
				}catch(Exception e){
					System.out.println(sectionindex);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			s.close();
		}
		
	}
	
	public List<HouseBasic> getListBySection(String section, int currentpage,
			int pagecount) {
		// TODO Auto-generated method stub  s.createSQLQuery()
		return null;
	}

	public Integer getCount(HttpServletRequest request,String section) {
		Session s = null;
		try{
			s = getSession();
			String hql="";
			if(StringUtils.isBlank(section)){
				hql = "select count(id) as count from HouseBasic hb where 1=1 ";
			}else{
				hql = "select count(id) as count from HouseBasic hb where section in ("+section+")";
			}
			String location = request.getParameter("location");
			String names = request.getParameter("names");
			String  mobile = request.getParameter("mobile");
			String idcard = request.getParameter("idcard");
			String atype = request.getParameter("atype");
			String checkresult = request.getParameter("checkresult");
			
			StringBuffer sb = new StringBuffer();
			if(!StringUtils.isBlank(checkresult)){
				sb.append(" and checkresult = '").append(checkresult).append("'");
			}
			if(!StringUtils.isBlank(location)){
				sb.append(" and location like '%").append(location).append("%'");
			}
			if(!StringUtils.isBlank(names)){
				sb.append(" and names like '%").append(names).append("%'");
			}
			if(!StringUtils.isBlank(mobile)){
				sb.append(" and mobile = '").append(mobile).append("'");
			}
			if(!StringUtils.isBlank(idcard)){
				sb.append(" and idcard = '").append(idcard).append("'");
			}
			Query query = s.createQuery(hql+sb.toString());
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
	public List<DisplayBean> getDisplayBeanList(String sql, String orderSql,
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
			if(StringUtils.isBlank(orderSql)){
				sb.append(" order by a.sortnum asc ");
			}else{
				sb.append(orderSql);
			}
			if(pagecount > 0){
				sb.append(" LIMIT ").append(currentpage).append(",").append(pagecount);
			}
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
	
	/**
	 * 通过标段分组
	 */
	public List<Integer> getListGroupBySection(String type){
		Session s = null;
		try{
			s = getSession();
			StringBuffer sb = new StringBuffer();
			if(type.equals("0")){ //已签约
				sb.append(" select count(a.id) as count,a.section from housebasic a " +
						"left join agreenment b on a.id = b.housebasicid " +
						" left join indexnum c on a.id = c.housebasicid "+
						"where c.indexnum is not null " +
						"group by a.section order by (a.section+0) ");
			}else if(type.equals("1")){ //未签约
				sb.append(" select count(a.id) as count ,a.section from housebasic a " +
						"left join agreenment b on a.id = b.housebasicid " +
						" left join indexnum c on a.id = c.housebasicid "+
						"where c.indexnum is null " +
						"group by a.section order by  (a.section+0) ");
			}else{//总共
//				sb.append(" select count(a.id) from housebasic a " +
//						"left join agreenment b on a.id = b.housebasicid " +
//						" left join indexnum c on a.id = c.housebasicid "+
//						"where c.indexnum is null " +
//						"");
			}
			List<Object[]> list = s.createSQLQuery(sb.toString()).list();
			List<Integer> iList = objectListToOrganList(list);
			return iList;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		return null;
	}
	
	/**
	 * 获取交房人数
	 */
	public Integer getSumHasOthers(String type,String dateStr){
		Session s = null;
		try{
			s = getSession();
			StringBuffer sb = new StringBuffer();
			sb.append(" select count(id) as count from housebasic where hasothers = '").append(type).append("'");
			if(!StringUtils.isBlank(dateStr)){
				sb.append(" and date_format(jfDate,'yyyy-MM-dd') = '").append(dateStr).append("'");
			}
			List<BigInteger> list = s.createSQLQuery(sb.toString()).list();
//			List<Integer> iList = objectListToOrganList(list);
			BigInteger bi = list.get(0);
			return bi.intValue();
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}finally{
			s.close();
		}
	}
	
	public List getSumHouseInfo(String type,String dateStr){
		Session s = null;
		try{
			s = getSession();
			StringBuffer sb = new StringBuffer();
			sb.append(" select sum(yjs) as yjs,sum(ljs70) as ljs70, sum(ljs75) as ljs75,sum(ljs80) as ljs80,sum(ljs85) as ljs85," +
					" sum(sjs) as sjs from agreenment b left join housebasic a on a.id = b.housebasicid where a.id is not null ");			
			List<Object[]> list = s.createSQLQuery(sb.toString()).list();
//			List<Integer> iList = objectListToOrganList(list);
			Object[] o = list.get(0);
			List rList = Arrays.asList(o);
			return rList;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			s.close();
		}
	}
	
	 private List<Integer> objectListToOrganList(List<Object[]> objectList) {
	     List<Integer> allOrganList = new ArrayList<Integer>();
	     for (int x = 0; x < objectList.size(); x++) {
	    	 String sCount = objectList.get(x)[0].toString();
	    	 if(StringUtils.isBlank(sCount)){
	    		 allOrganList.add(0);
	    	 }else{
	    		 allOrganList.add(Integer.parseInt(sCount));
	    	 }
	     }
	     return allOrganList;
	 }

	public int getCountBySectionindex(String sectionindex, String section) {
		Session s = null;
		try{
			s = getSession();
			StringBuffer sb = new StringBuffer();
			sb.append(" select count(id) as count from housebasic where sectionindex like '%"+sectionindex+"%'");
			List<BigInteger> list = s.createSQLQuery(sb.toString()).list();
//			List<Integer> iList = objectListToOrganList(list);
			BigInteger bi = list.get(0);
			return bi.intValue();
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}finally{
			s.close();
		}
	}

	public HouseBasic getByIdCard(String idcard) {
		Session s = null;
		List<HouseBasic> list = null;
		try{
			s = getSession();
			list = s.createCriteria(HouseBasic.class).add(
					Restrictions.eq("idcard", idcard))
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