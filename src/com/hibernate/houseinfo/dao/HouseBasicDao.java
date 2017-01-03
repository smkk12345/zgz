package com.hibernate.houseinfo.dao;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.impl.SQLQueryImpl;
import org.hibernate.mapping.Array;
import org.hibernate.transform.Transformers;
import org.springframework.jdbc.object.SqlQuery;
import org.springframework.ui.ModelMap;

import com.common.utils.StringUtils;
import com.hibernate.base.BaseDaoImpl;
import com.hibernate.houseinfo.domain.AgreenmentSectionBean;
import com.hibernate.houseinfo.domain.DisplayBean;
import com.hibernate.houseinfo.domain.HouseBasic;
import com.hibernate.houseinfo.domain.IndexNum;
import com.hibernate.houseinfo.domain.VacatePeople;
import com.hibernate.userInfo.damain.User;
import com.hibernate.utils.SortUtils;
import com.spring.ServiceManager;

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
	public List<Integer> getListGroupBySection(String type,String dateStr){
		Session s = null;
		try{
			s = getSession();
			StringBuffer sb = new StringBuffer();
			if(type.equals("0")){ //已签约
				sb.append(" select count(a.id) as count,a.section from housebasic a " +
						"left join agreenment b on a.id = b.housebasicid " +
						" left join indexnum c on a.id = c.housebasicid "+
						"where c.indexnum is not null ");
				if(!StringUtils.isBlank(dateStr)){
					sb.append(dateStr);
				}
				sb.append("group by a.section order by (a.section+0) ");
			}else if(type.equals("1")){ //未签约
				sb.append(" select count(a.id) as count ,a.section from housebasic a " +
						"left join agreenment b on a.id = b.housebasicid " +
						" left join indexnum c on a.id = c.housebasicid "+
						"where c.indexnum is null ");
				
				if(!StringUtils.isBlank(dateStr)){
					sb.append(dateStr);
				}
				
				sb.append("group by a.section order by  (a.section+0) ");
			}else{//总共
//				sb.append(" select count(a.id) from housebasic a " +
//						"left join agreenment b on a.id = b.housebasicid " +
//						" left join indexnum c on a.id = c.housebasicid "+
//						"where c.indexnum is null " +
//						"");
			}
			List<Object[]> list = s.createSQLQuery(sb.toString()).list();
			List<Integer> iList = objectListToOrganList_new(list);
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
			if(!StringUtils.isBlank(type)){
				if(type.equals("0")){
					sb.append(" select count(a.id) as count from housebasic a left join indexnum b on a.id = b.housebasicid where (a.hasothers = '").append(type).append("'");
					sb.append(" or a.hasothers is null  or a.hasothers='' ) and (b.id is not null) ");
				}else{
					sb.append(" select count(id) as count from housebasic where hasothers = '").append(type).append("'");
				}
			}
			if(!StringUtils.isBlank(dateStr)){
				sb.append(" and date_format(jfDate,'%Y-%m-%d') = '").append(dateStr).append("'");
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
			sb.append(" and (b.protocolnumber is not null and b.protocolnumber != '')");
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
	    	 String section  = objectList.get(x)[1].toString();
	    	 if(StringUtils.isBlank(sCount)){
	    		 allOrganList.add(0);
	    	 }else{
	    		 allOrganList.add(Integer.parseInt(sCount));
	    	 }
	     }
	     return allOrganList;
	 }
	 
	 private List<Integer> objectListToOrganList_new(List<Object[]> objectList) {
		 List<Integer> allOrganList = new ArrayList<Integer>();
		 Map<String,Integer> map = objectListToMap(objectList);
		 allOrganList = objectListToOrganList_new(map);
		 return allOrganList;
	 }
	 
	 private Map<String,Integer> objectListToMap(List<Object[]> objectList) {
	     Map<String,Integer> map = new HashMap();
	     for (int x = 0; x < objectList.size(); x++) {
	    	 String sCount = objectList.get(x)[0].toString();
	    	 String section  = objectList.get(x)[1].toString();
	    	 map.put(section, Integer.parseInt(sCount));
	     }
	     return map;
	 }

	 private List<Integer> objectListToOrganList_new(Map<String,Integer> map) {
	     List<Integer> allOrganList = new ArrayList<Integer>();
	     for (int x = 1; x < 8; x++) {
	    	 if(map.containsKey(""+x)){
	    		 allOrganList.add(map.get(""+x));
	    	 }else{
	    		 allOrganList.add(0);
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
	 //-------------------------------数据统计部分代码----------------------------//
	 
	
	
	public List<AgreenmentSectionBean> getAgSessionBeanList(String sql) {
		List<AgreenmentSectionBean> list = new ArrayList<AgreenmentSectionBean>();
		Session s = null;
		try{
			s = getSession();
			StringBuffer sb = new StringBuffer();
			sb.append(" select count(a.id) as qycount,a.section,b.atype as qytype, 1 as qystatus from housebasic a "+
			" left join agreenment b on a.id = b.housebasicid "+
			" left join indexnum c on a.id = c.housebasicid  "+
			"  where 1=1  " );
			if(!StringUtils.isBlank(sql)){
				sb.append(sql);
			}
			sb.append(" group by a.section, b.atype order by  (a.section+0) ");
			Connection c = s.connection();
			Statement state = c.createStatement();
			ResultSet rs = state.executeQuery(sb.toString());
			try {
				while (rs.next()) {
					String qycount = rs.getString("qycount");
					String section = rs.getString("section");
					String qytype = rs.getString("qytype");
					String qystatus = rs.getString("qystatus");
					AgreenmentSectionBean bean = new AgreenmentSectionBean();
					bean.setQycount(Integer.parseInt(qycount));
					bean.setSection(section);
					bean.setQytype(qytype);
					bean.setQystatus(qystatus);
					list.add(bean);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}finally{
				try {
					rs.close();
					state.close();
					c.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
				
			}
//			System.out.println("sql0="+new Date().getTime());
//			List list0 = s.createSQLQuery(sb.toString()).
//					addScalar("qycount",Hibernate.INTEGER).
//					addScalar("section", Hibernate.STRING).
//					addScalar("qytype",Hibernate.STRING).
//					addScalar("qystatus",Hibernate.STRING).
//					list();
//			System.out.println("sql1="+new Date().getTime());
//			for (Iterator iterator = list0.iterator(); iterator.hasNext();) {
//				// 每个集合元素都是一个数组，数组元素师person_id,person_name,person_age三列值
//				Object[] objects = (Object[]) iterator.next();
//				
//				AgreenmentSectionBean bean = new AgreenmentSectionBean();
//				bean.setQycount(Integer.parseInt(objects[0]+""));
//				bean.setSection((String)objects[1]);
//				bean.setQytype((String)objects[2]);
//				bean.setQystatus((String)objects[3]);
//				list.add(bean);
//			}
			System.out.println("sql2="+new Date().getTime());
			return list;
		}catch(Exception e){
			e.printStackTrace();
			return list;
		}finally{
			s.close();
		}
	}

	public List<AgreenmentSectionBean> getHasOthersBeanList(String sql) {
		List<AgreenmentSectionBean> list = new ArrayList<AgreenmentSectionBean>();
		Session s = null;
		try {
			s = getSession();
			StringBuffer sb = new StringBuffer();
			sb.append(" select count(id) as qycount, section from housebasic where 1=1 ");
			if(!StringUtils.isBlank(sql)){
				sb.append(sql);
			}
			sb.append(" group by section order by (section+0)");
			
			Connection c = s.connection();
			Statement state = c.createStatement();
			ResultSet rs = state.executeQuery(sb.toString());
			try {
				while (rs.next()) {
					String qycount = rs.getString("qycount");
					String section = rs.getString("section");
					AgreenmentSectionBean bean = new AgreenmentSectionBean();
					bean.setQycount(Integer.parseInt(qycount));
					bean.setSection(section);
					list.add(bean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				try {
					rs.close();
					state.close();
					c.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
//			List list0 = s.createSQLQuery(sb.toString()).
//					addScalar("qycount",Hibernate.INTEGER).
//					addScalar("section", Hibernate.STRING).
//					list();
//			for (Iterator iterator = list0.iterator(); iterator.hasNext();) {
//				// 每个集合元素都是一个数组，数组元素师person_id,person_name,person_age三列值
//				Object[] objects = (Object[]) iterator.next();
//				
//				AgreenmentSectionBean bean = new AgreenmentSectionBean();
//				bean.setQycount(Integer.parseInt(objects[0]+""));
//				bean.setSection((String)objects[1]);
//				list.add(bean);
//			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return list;
		}
		return list;
	}
	
	
	public List<Map<String,Integer>> getListByCheckResult(String subSql){
		List<Map<String,Integer>> result = new ArrayList<Map<String,Integer>>();
		Session s = null;
		try {
			s = getSession();
			StringBuffer sb = new StringBuffer();//	and id = '1'
			sb.append("SELECT count(*) as shcount,section  as displaysection FROM housebasic  where 1=1 ");
			if(!StringUtils.isBlank(subSql)){
				sb.append(subSql);
			}
			sb.append(" group by section order by (section+0) ");//section+0 
			List list0 = s.createSQLQuery(sb.toString())
					.addScalar("shcount",Hibernate.STRING)
					.addScalar("displaysection",Hibernate.STRING)
					.list();
			for(Iterator it = list0.iterator();it.hasNext();){
				Object[] objects = (Object[])it.next();
				Map<String,Integer> map = new HashMap<String, Integer>();
				map.put("shcount", Integer.parseInt(objects[0]+""));
				map.put("displaysection", Integer.parseInt(objects[1]+""));
				result.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public boolean unSign(String housebasicid, String agreenmentid) {
		// TODO Auto-generated method stub
		//这种处理方式  1 将agreenment中的 Pro号清理掉 2 将indexnum中的housebasicid变更 3 解除锁定
		
		String sql1 = " UPDATE agreenment set protocolnumber = null where id = '"+agreenmentid+"'";
		String sql2 = " UPDATE indexnum set housebasicid = housebasicid"+"_temp" +" WHERE housebasicid = '"+housebasicid+"'";
		String sql3 = " UPDATE housebasic set islock = '0' where id = '"+housebasicid+"'";
		Session s = null;
		try {
			s = getSession();
			s.createSQLQuery(sql1.toString()).executeUpdate();
			s.createSQLQuery(sql2.toString()).executeUpdate();
			s.createSQLQuery(sql3.toString()).executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	//数据导出
	
	public List<String> getFieldFromView(String viewName){
		List<String> list = new ArrayList<String>();
		Session s = null;
		Statement state = null;
		ResultSet rs = null;
		try {
			s = getSession();
			StringBuffer sb = new StringBuffer();
			sb.append("SELECT * FROM `"+viewName+"`;");
			state = s.connection().createStatement();
			rs = state.executeQuery(sb.toString());
			ResultSetMetaData data = rs.getMetaData();
			for (int j = 0; j < data.getColumnCount(); j++) {
				list.add(data.getColumnLabel(j+1));
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			try {
				if(null != rs){
					rs.close();
				}
				if(null != state){
					state.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			s.close();
		}
		return list;
	}
	
	
	public List<Map<String,String>> getDataFromView(String viewName,String subSql){
		List<Map<String,String>> list = null;
		Session s = null;
		try {
			s = getSession();
			StringBuffer sb = new StringBuffer();
			sb.append("SELECT * FROM `"+viewName+"` where 1= 1 ");
			if(!StringUtils.isBlank(subSql)){
				sb.append(subSql);
			}
			list = s.createSQLQuery(sb.toString())
					.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
//			List<DisplayBean> list = s.createSQLQuery(sb.toString()).addEntity(DisplayBean.class).list();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Map<String, String>> getBCKZJMapList(String atype) {
		// TODO Auto-generated method stub
		List<Map<String, String>> list = new ArrayList<Map<String,String>>();
		StringBuffer sb = new StringBuffer();
		sb.append(" select  a.section ,sum(b.zjdttzj) as zjdttzj from agreenment b  ");
		sb.append(" left join housebasic a on a.id = b.housebasicid ");
		if(StringUtils.isBlank(atype)){
			sb.append("   where (b.protocolnumber is not null and b.protocolnumber != '')  group by a.section ");
		}else{
			sb.append("   where (b.protocolnumber is not null and b.protocolnumber != '') and b.atype = '"+atype+"' group by a.section ");
		}
		Session s = getSession();
		
		Connection c = s.connection();
		Statement state;
		try {
			state = c.createStatement();
			ResultSet rs = state.executeQuery(sb.toString());
			try {
				while (rs.next()) {
					String section = rs.getString("section");
					String zjdttzj = rs.getString("zjdttzj");
					Map<String,String> map = new HashMap<String, String>();
					map.put("section", section);
					map.put("zjdttzj", zjdttzj);
					list.add(map);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				try {
					rs.close();
					state.close();
					c.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
				
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return list;
	}
	
	
//	select  a.zqyhs as '总签约户数',b.fwazqyhs as '房屋安置签约户数',c.hbazqyhs as '货币补偿签约户数'
//	,d.ttbczj as '腾退补偿款总价(元)',e.fwazttbczj as '房屋安置腾退补偿款总价(元)',f.hbazttbczj as '货币补偿退补偿款总价(元)'
//	,g.gfk as '购房款(元)',h.jshk as'结算后款(元)',i.rdzjdallarea as '认定宅基地面积' from 
//
//	(select count(indexnum) as zqyhs,1 as id  from indexnum) a
//
//	left join (select count(id) as fwazqyhs,1 as id   from aznum) b on a.id = b.id
//
//	left join (select count(id) as hbazqyhs,1 as id  from hbnum) c on a.id = c.id
//
//	left join (
//	select sum(b.zjdttzj) as ttbczj,1 as id from agreenment b 
//	  left join housebasic a on a.id = b.housebasicid
//	     where (b.protocolnumber is not null and b.protocolnumber != '')) d on  a.id = d.id
//	left join (select sum(b.zjdttzj) as fwazttbczj,1 as id from agreenment b 
//	  left join housebasic a on a.id = b.housebasicid
//	     where (b.protocolnumber is not null and b.protocolnumber != '')  and b.atype = '0') e on  a.id = e.id
//	left join(select sum(b.zjdttzj) as hbazttbczj,1 as id from agreenment b 
//	  left join housebasic a on a.id = b.housebasicid
//	     where (b.protocolnumber is not null and b.protocolnumber != '')  and b.atype = '1') f on a.id=f.id
	
	
//	left join(select sum(b.azfgfk) as gfk,1 as id from agreenment b 
//	  left join housebasic a on a.id = b.housebasicid
//	     where (b.protocolnumber is not null and b.protocolnumber != '') and b.atype = '0') g on a.id = g.id
	
//	left join(select sum(b.jshk) as jshk,1 as id from agreenment b 
//	  left join housebasic a on a.id = b.housebasicid
//	     where (b.protocolnumber is not null and b.protocolnumber != '') and b.atype = '0') h on a.id = h.id
//	left join(select sum(b.rdzjdallarea) as rdzjdallarea,1 as id from agreenment b 
//	  left join housebasic a on a.id = b.housebasicid
//	     where (b.protocolnumber is not null and b.protocolnumber != '')) i on a.id = i.id
	
	
	public List<Map<String, String>> getSumKuan() {
		// TODO Auto-generated method stub
		List<Map<String, String>> list = new ArrayList<Map<String,String>>();
		StringBuffer sb = new StringBuffer();
		sb.append(" select  a.zqyhs ,b.fwazqyhs ,c.hbazqyhs  ");
		sb.append(" ,d.ttbczj ,e.fwazttbczj ,f.hbazttbczj  ");
		sb.append(" ,g.gfk ,h.jshk ,i.rdzjdallarea  from  ");
		sb.append(" (select count(indexnum) as zqyhs,1 as id  from indexnum) a ");
		sb.append(" left join (select count(id) as fwazqyhs,1 as id   from aznum) b on a.id = b.id ");
		sb.append(" left join (select count(id) as hbazqyhs,1 as id  from hbnum) c on a.id = c.id ");
		sb.append("  left join ( ");
		
		sb.append(" select sum(b.zjdttzj) as ttbczj,1 as id from agreenment b ");
		sb.append(" left join housebasic a on a.id = b.housebasicid ");
		sb.append(" where (b.protocolnumber is not null and b.protocolnumber != '')) d on  a.id = d.id ");
		
		sb.append(" left join (select sum(b.zjdttzj) as fwazttbczj,1 as id from agreenment b  ");
		sb.append(" left join housebasic a on a.id = b.housebasicid ");
		sb.append(" where (b.protocolnumber is not null and b.protocolnumber != '')  and b.atype = '0') e on  a.id = e.id ");
		sb.append(" left join(select sum(b.zjdttzj) as hbazttbczj,1 as id from agreenment b  ");
		sb.append("  left join housebasic a on a.id = b.housebasicid ");
		sb.append(" where (b.protocolnumber is not null and b.protocolnumber != '')  and b.atype = '1') f on a.id=f.id ");
		sb.append(" left join(select sum(b.azfgfk) as gfk,1 as id from agreenment b  ");
		sb.append(" left join housebasic a on a.id = b.housebasicid ");
		sb.append("  where (b.protocolnumber is not null and b.protocolnumber != '') and b.atype = '0') g on a.id = g.id ");
		sb.append(" left join(select sum(b.jshk) as jshk,1 as id from agreenment b  ");
		sb.append(" left join housebasic a on a.id = b.housebasicid ");
		sb.append(" where (b.protocolnumber is not null and b.protocolnumber != '') and b.atype = '0') h on a.id = h.id ");
		sb.append(" left join(select sum(b.rdzjdallarea) as rdzjdallarea,1 as id from agreenment b  ");
		sb.append(" left join housebasic a on a.id = b.housebasicid ");
		sb.append(" where (b.protocolnumber is not null and b.protocolnumber != '')) i on a.id = i.id ");
		
		Session s = getSession();
		
		Connection c = s.connection();
		Statement state;
		try {
			state = c.createStatement();
			ResultSet rs = state.executeQuery(sb.toString());
			try {
				while (rs.next()) {
					sb.append(" select  a.zqyhs ,b.fwazqyhs ,c.hbazqyhs  ");
					sb.append(" ,d.ttbczj ,e.fwazttbczj ,f.hbazttbczj  ");
					sb.append(" ,g.gfk ,h.jshk ,i.rdzjdallarea  from  ");
					
					String zqyhs = rs.getString("zqyhs");
					String fwazqyhs = rs.getString("fwazqyhs");
					String hbazqyhs = rs.getString("hbazqyhs");
					String ttbczj = rs.getString("ttbczj");
					String fwazttbczj = rs.getString("fwazttbczj");
					String hbazttbczj = rs.getString("hbazttbczj");
					String gfk = rs.getString("gfk");
					String jshk = rs.getString("jshk");
					String rdzjdallarea = rs.getString("rdzjdallarea");
					
					Map<String,String> map = new HashMap<String, String>();
					map.put("zqyhs", zqyhs);
					map.put("fwazqyhs", fwazqyhs);
					map.put("hbazqyhs", hbazqyhs);
					map.put("ttbczj", ttbczj);
					map.put("fwazttbczj", fwazttbczj);
					map.put("hbazttbczj", hbazttbczj);
					map.put("gfk", gfk);
					map.put("jshk", jshk);
					map.put("rdzjdallarea", rdzjdallarea);
					list.add(map);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				try {
					rs.close();
					state.close();
					c.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
				
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return list;
	}
	
}