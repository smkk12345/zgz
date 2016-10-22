package com.hibernate.houseinfo.service;

import java.util.ArrayList;
import java.util.List;

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
		HouseBasic t = houseBasicDao.save(houseBasic);
		try {
			boolean result2 = otherInfoDao.batchSave(houseBasic.getIllList());
			boolean result3 = otherInfoDao.batchSave(houseBasic.getBasicLivingList());
			boolean result4 = otherInfoDao.batchSave(houseBasic.getDeformityList());
			boolean result5 = vacatePeopleDao.batchSave(houseBasic.getList());
			boolean result6 = vacatePeopleDao.batchSave(houseBasic.getVacatelist());
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
		houseBasic.setIllList(illList);
		houseBasic.setVacatelist(vacatelist);
		houseBasic.setList(list);
		houseBasic.setBasicLivingList(basicLivingList);
		houseBasic.setDeformityList(deformityList);
		return houseBasic;
	}
	
	

}
