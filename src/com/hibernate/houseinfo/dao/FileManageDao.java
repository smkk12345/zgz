package com.hibernate.houseinfo.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.ui.ModelMap;

import com.common.utils.StringUtils;
import com.hibernate.base.BaseDaoImpl;
import com.hibernate.houseinfo.domain.FileManageBean;
import com.hibernate.houseinfo.domain.HouseBasic;

public class FileManageDao extends BaseDaoImpl<FileManageBean> {

	
	/**
	 * 通过入户基本信息获取上传的档案列表
	 * @param housebasicid
	 * @return
	 */
	public List<FileManageBean> findListByBaseId(String housebasicid){
		List<FileManageBean> list = null;
			// TODO Auto-generated method stub
		Session s = null;
		try{
			s = getSession();
			Criteria c = s.createCriteria(FileManageBean.class);
			list = c.add(Restrictions.eq("housebasicid", housebasicid))
					.add(Restrictions.eq("isdel", "0"))
					.addOrder(Order.asc("updateTime")).list();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		return list;
	}
}
