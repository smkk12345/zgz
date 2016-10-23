package com.hibernate.houseinfo.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.common.utils.StringUtils;
import com.hibernate.base.BaseDaoImpl;
import com.hibernate.houseinfo.domain.HouseBasic;
import com.hibernate.houseinfo.domain.OtherInfo;

public class OtherInfoDao extends BaseDaoImpl<OtherInfo> {
	
	public List<OtherInfo> findList(String housebasicid,String type){
		List<OtherInfo> list = null;
		Session s = null;
		try{
			s = getSession();
			Criteria c = s.createCriteria(OtherInfo.class);
			list = c.add(Restrictions.eq("housebasicid", housebasicid))
					.add(Restrictions.eq("otype", type))
					.addOrder(Order.asc("createTime"))
					.list();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
		return list;
	}
	
	public boolean batchSave(List<OtherInfo> list,String
			houseBasicId){
		try {
//			Session session =  getSession();
//			Transaction tx = session.beginTransaction();
			for(int i=0;i<list.size();i++){
				OtherInfo otherInfoser = list.get(i);
				otherInfoser.setHousebasicid(houseBasicId);
				if(StringUtils.isEmpty(otherInfoser.getId())){
					save(otherInfoser);
				}else{
					update(otherInfoser);
				}
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

	public void delByHouseBasicId(String id) {
		Session s = null;
		try{
			s = getSession();
			String sql = "DELETE FROM OtherInfo WHERE housebasicid = '"+id+"'";
			s.createQuery(sql).executeUpdate(); 
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			s.close();
		}
	}
}
