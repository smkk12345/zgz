package com.hibernate.houseinfo.service;

import java.util.Date;
import java.util.List;

import com.hibernate.houseinfo.dao.IndexNumDao;
import com.hibernate.houseinfo.domain.IndexNum;
import com.hibernate.timers.utils.DateStyle;
import com.hibernate.timers.utils.DateUtil;

public class IndexNumService {
	
	private IndexNumDao indexNumDao;

	public IndexNumDao getIndexNumDao() {
		return indexNumDao;
	}

	public void setIndexNumDao(IndexNumDao indexNumDao) {
		this.indexNumDao = indexNumDao;
	}
	
	public IndexNum getIndexNum(String ip,String userid,String housebasicid,String atype){
		IndexNum indexNum = new IndexNum();
		indexNum.setServiceip(ip);
		indexNum.setOperatedate(DateUtil.DateToString(new Date(),
				DateStyle.YYYY_MM_DD_HH_MM_SS));
		indexNum.setCreateTime(new Date());
		indexNum.setHousebasicid(housebasicid);
		indexNum.setUpdateTime(new Date());
		indexNum.setTime(new Date().getTime());
		indexNum.setUserid(userid);
		if(atype.equals("0")){
			indexNum.setIndexnum(indexNumDao.saveAz().getIndexnum());
		}else{
			indexNum.setIndexnum(indexNumDao.saveHb().getIndexnum());
		}
		indexNum = indexNumDao.save(indexNum);
		return indexNum;
	}
	
	public IndexNum getIndexNum(String housebasicid){
		IndexNum indexnum = indexNumDao.getByBasicId(housebasicid);
		return indexnum;
	}
	/**
	 * 清空数据
	 * @return
	 */
	public boolean clearIndexNum(){
		return indexNumDao.clearIndexNum();
	}
	/**
	 * 分页数据
	 * @param startNum
	 * @param endNum
	 * @return
	 */
	public List<IndexNum> getList(int startNum,int endNum){
		return indexNumDao.getList(startNum,endNum);
	}
	
}
