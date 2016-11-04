package com.hibernate.houseinfo.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.ui.ModelMap;

import com.hibernate.houseinfo.dao.AgreenmentDao;
import com.hibernate.houseinfo.dao.HouseBasicDao;
import com.hibernate.houseinfo.dao.IndexNumDao;
import com.hibernate.houseinfo.dao.OtherInfoDao;
import com.hibernate.houseinfo.dao.VacatePeopleDao;
import com.hibernate.houseinfo.domain.Agreement;
import com.hibernate.houseinfo.domain.DisplayBean;
import com.hibernate.houseinfo.domain.HouseBasic;
import com.hibernate.houseinfo.domain.IndexNum;
import com.hibernate.houseinfo.domain.OtherInfo;
import com.hibernate.houseinfo.domain.VacatePeople;
import com.hibernate.timers.utils.DateStyle;
import com.hibernate.timers.utils.DateUtil;

public class HouseBasicService {

	private HouseBasicDao houseBasicDao;
	private OtherInfoDao otherInfoDao;
	private VacatePeopleDao vacatePeopleDao;
	private AgreenmentDao agreenmentDao;
	private IndexNumDao indexNumDao;
	
	public void setIndexNumDao(IndexNumDao indexNumDao) {
		this.indexNumDao = indexNumDao;
	}
	public void setAgreenmentDao(AgreenmentDao agreenmentDao) {
		this.agreenmentDao = agreenmentDao;
	}
	public void setHouseBasicDao(HouseBasicDao houseBasicDao) {
		this.houseBasicDao = houseBasicDao;
	}
	public void setOtherInfoDao(OtherInfoDao otherInfoDao) {
		this.otherInfoDao = otherInfoDao;
	}
	public void setVacatePeopleDao(VacatePeopleDao vacatePeopleDao) {
		this.vacatePeopleDao = vacatePeopleDao;
	}
	
	//非在册人员列表
//		List<VacatePeople> list = new ArrayList<VacatePeople>();
		//大病
//		List<OtherInfo> illList = new ArrayList<OtherInfo>();
		//低保
//		List<OtherInfo> basicLivingList = new ArrayList<OtherInfo>();
		//残疾
//		List<OtherInfo> deformityList = new ArrayList<OtherInfo>();
	public boolean save(HouseBasic houseBasic){
		
		HouseBasic t = houseBasic;
		houseBasic.setUpdateTime(new Date());
		if(StringUtils.isBlank(t.getId())){
			houseBasic.setCreateTime(new Date());
			t = houseBasicDao.save(houseBasic);
		}else{
			houseBasicDao.update(houseBasic);
			otherInfoDao.delByHouseBasicId(houseBasic.getId());
			vacatePeopleDao.delByHouseBasicId(houseBasic.getId());
		}
		
		try {
			boolean result2 = otherInfoDao.batchSave(houseBasic.getIllList(),houseBasic.getId());
			boolean result3 = otherInfoDao.batchSave(houseBasic.getBasicLivingList(),houseBasic.getId());
			boolean result4 = otherInfoDao.batchSave(houseBasic.getDeformityList(),houseBasic.getId());
			boolean result5 = vacatePeopleDao.batchSave(houseBasic.getList(),houseBasic.getId());
			boolean result6 = vacatePeopleDao.batchSave(houseBasic.getVacatelist(),houseBasic.getId());
			return t!= null &&result2&&result3&&result4&&result5&&result6;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public HouseBasic getHouseBasicById(String id,String section){
		HouseBasic houseBasic = houseBasicDao.findById(id, section);
		
		//腾云人列表
		List<VacatePeople> vacatelist = vacatePeopleDao.findList(id,"0");
		//非在册人员列表
		List<VacatePeople> list = vacatePeopleDao.findList(id,"1");
		//大病
		List<OtherInfo> illList = otherInfoDao.findList(id,"2");
		//低保
		List<OtherInfo> basicLivingList = otherInfoDao.findList(id,"0");
		//残疾
		List<OtherInfo> deformityList = otherInfoDao.findList(id,"1");
		
		List<OtherInfo> otherList = otherInfoDao.findList(id, "0,1,2");
		Agreement agreement = agreenmentDao.getByHouseBasicId(id);
		if(null != agreement){
			houseBasic.setAgreenment(agreement);
		}
		if(null != otherList){
			houseBasic.setOtherList(otherList);
		}
		if(null != illList){
			houseBasic.setIllList(illList);
		}
		if(null != list){
			houseBasic.setList(list);
		}
		if(null != vacatelist){
			houseBasic.setVacatelist(vacatelist);
		}
		if(null !=basicLivingList){
			houseBasic.setBasicLivingList(basicLivingList);
		}
		if(null != deformityList){
			houseBasic.setDeformityList(deformityList);
		}
		return houseBasic;
	}
	
	public List<HouseBasic> getListBySection(HttpServletRequest request,ModelMap model,String section,int currentpage,int pagecount){
		List<HouseBasic> list = houseBasicDao.findList(request,model,section,currentpage,pagecount);
		if(null == list){
			return null;
		}
		for (int i = 0; i < list.size(); i++) {
			HouseBasic houseBasic = list.get(i);
			houseBasic.setAgreenment(agreenmentDao.getByHouseBasicId(houseBasic.getId()));
			houseBasic.setIndexNum(indexNumDao.getByBasicId(houseBasic.getId()));
		}
		return list;
	}
	
	public boolean delVacatePeopleById(String id){
		vacatePeopleDao.delete(id);
		return true;
	}
	
	public boolean delOther(String id){
		otherInfoDao.delete(id);
		return true;
	}
	public boolean delHouseBasicById(String id){
		//删除基本信息
		houseBasicDao.delete(id);
		//删除被腾退人信息
		vacatePeopleDao.delByHouseBasicId(id);
		//删除其他信息  如低保，残疾人，登封
		otherInfoDao.delByHouseBasicId(id);
		return true;
	}
	public Integer getCount(String section) {
		// TODO Auto-generated method stub
		return houseBasicDao.getCount(section);
	}

	/**
	 * 统计的代码全部在这里面
	 * 
	 * 这个是大屏幕获取顺序号的方法
	 * @param section
	 * @param currentpage
	 * @param pagecount
	 * @return
	 */
	public List<IndexNum> getIndexNumList(String section, int currentpage,int pagecount){
		return houseBasicDao.getIndexNumList(section, currentpage, pagecount); 
	}
	
	public List<DisplayBean> getDisplayBeanList(String sql, String orderSql,
			int currentpage,int pagecount){
		return houseBasicDao.getDisplayBeanList(sql,orderSql,currentpage,pagecount);
	}
	public DisplayBean getDisplayBean(String housebasicid){
		List<DisplayBean> list = houseBasicDao.getDisplayBeanList(" and a.id = '"+housebasicid+"' ","",0,2);
		if(null != list && list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
		
	}
	public Integer getDisPlayCount(String sql) {
		// TODO Auto-generated method stub
		return houseBasicDao.getDisPlayCount(sql);
	}
	public void confirmOthers(String housebasicid) {
		// TODO Auto-generated method stub
		HouseBasic houseBasic = houseBasicDao.getById(housebasicid);
		houseBasic.setHasothers("1");
		houseBasic.setJfDate(DateUtil.DateToString(new Date(),DateStyle.YYYY_MM_DD_HH_MM_SS_EN));
		houseBasicDao.update(houseBasic);
	}
	
	public List<Integer> getListGroupBySection(String type){
		return houseBasicDao.getListGroupBySection(type);
	}
	
	public Integer getSumHasOthers(String type,String dateStr){
		return houseBasicDao.getSumHasOthers(type,dateStr);
	}
	
	public List getSumHouseInfo(String type,String dateStr){
		return houseBasicDao.getSumHouseInfo(type,dateStr);
	}
}
