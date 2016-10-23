package com.hibernate.houseinfo.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.hibernate.houseinfo.dao.HouseBasicDao;
import com.hibernate.houseinfo.dao.OtherInfoDao;
import com.hibernate.houseinfo.dao.VacatePeopleDao;
import com.hibernate.houseinfo.domain.HouseBasic;
import com.hibernate.houseinfo.domain.OtherInfo;
import com.hibernate.houseinfo.domain.VacatePeople;

public class HouseBasicService {

	private HouseBasicDao houseBasicDao;
	private OtherInfoDao otherInfoDao;
	private VacatePeopleDao vacatePeopleDao;
	
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
		if(StringUtils.isBlank(t.getId())){
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
	
	public List<HouseBasic> getListBySection(String section,int currentpage,int pagecount){
		return houseBasicDao.findList(section,currentpage,pagecount);
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

}
