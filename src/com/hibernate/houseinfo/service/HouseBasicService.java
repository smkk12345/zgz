package com.hibernate.houseinfo.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.hibernate.Session;
import org.springframework.ui.ModelMap;

import com.hibernate.houseinfo.dao.AgreenmentDao;
import com.hibernate.houseinfo.dao.HouseBasicDao;
import com.hibernate.houseinfo.dao.IndexNumDao;
import com.hibernate.houseinfo.dao.OtherInfoDao;
import com.hibernate.houseinfo.dao.VacatePeopleDao;
import com.hibernate.houseinfo.domain.Agreement;
import com.hibernate.houseinfo.domain.AgreenmentSectionBean;
import com.hibernate.houseinfo.domain.DisplayBean;
import com.hibernate.houseinfo.domain.HouseBasic;
import com.hibernate.houseinfo.domain.IndexNum;
import com.hibernate.houseinfo.domain.OtherInfo;
import com.hibernate.houseinfo.domain.VacatePeople;
import com.hibernate.timers.utils.DateStyle;
import com.hibernate.timers.utils.DateUtil;
import com.spring.utils.ExportExcel;

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
			
			//计算金钱
			calcMony(houseBasic);
			
			return t!= null &&result2&&result3&&result4&&result5&&result6;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	private void calcMony(HouseBasic houseBasic) {
		Agreement agreenment = agreenmentDao.getByHouseBasicId(houseBasic.getId());
		if(null == agreenment){
			return ;
		}
		//如果是货币   直接返回
		if(agreenment.getAtype().equals("1")){
			return;
		}
		//人数变化之后  影响周转补助费  ---- 补助费 --腾退总价 -- 计算后款
		//补助费  + 奖励费 = 补助费合计 a
		//宅基地补偿款  b
		//购房款  c
		//腾退补偿总价 d = a+b
		//计算后款 f = d - c
		try {
			int people = houseBasic.getPeople();
			double zzbz = people*1500*40;
			double sum = 0.00;
			sum = getSumValue(sum,agreenment.getTqbjl());
			sum = getSumValue(sum,agreenment.getGcphjl());
			sum = getSumValue(sum,agreenment.getTtcjjl());
			sum = getSumValue(sum,agreenment.getWwzjl());
			sum = getSumValue(sum,agreenment.getWjecjj());
			sum = getSumValue(sum,agreenment.getWjpzyjecbz());
			sum = getSumValue(sum,agreenment.getBjbz());
			sum = getSumValue(sum,agreenment.getQfbz());
			sum = getSumValue(sum,agreenment.getDbbz());
			sum = getSumValue(sum,agreenment.getCjbz());
			sum = getSumValue(sum,agreenment.getDbhbz());
			//奖励费
			sum = getSumValue(sum,agreenment.getDsznbz());
			sum = getSumValue(sum,agreenment.getTctdbz());
			sum = sum+zzbz;
			sum = getSumValue(sum,agreenment.getDsbzf());
			sum = getSumValue(sum,agreenment.getXgbzf());
			sum = getSumValue(sum,agreenment.getZjdypwpbz());
			sum = getSumValue(sum,agreenment.getYhzbwxmbc());
			agreenment.setJlfsum(new BigDecimal(sum));
			//奖励补助费计算完毕
			sum = getSumValue(sum, agreenment.getZjdttbck());
			//腾退补偿总价
			double zjdttzj = sum;
			if(null !=agreenment.getAzfgfk()){
				double jshk = zjdttzj-agreenment.getAzfgfk().doubleValue();
				agreenment.setJshk(new BigDecimal(jshk));
			}else{
				agreenment.setJshk(new BigDecimal(zjdttzj));
			}
			
			agreenment.setZzbz(new BigDecimal(zzbz));
			agreenment.setZjdttzj(new BigDecimal(zjdttzj));
			agreenmentDao.update(agreenment);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private double getSumValue(double sum,BigDecimal bd){
		if(null != bd){
			return  (sum+bd.doubleValue());
		}else{
			return  (sum);
		}
	}
	
	public void justUpdateHouseBasic(HouseBasic housebasic){
		houseBasicDao.update(housebasic);
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
			houseBasic.setNotlocalpeoplecount(list.size());
		}
		if(null != vacatelist){
			houseBasic.setVacatelist(vacatelist);
			houseBasic.setLocalpeoplecount(vacatelist.size());
		}
		if(null !=basicLivingList){
			houseBasic.setBasicLivingList(basicLivingList);
		}
		if(null != deformityList){
			houseBasic.setDeformityList(deformityList);
		}
		return houseBasic;
	}
	public void updateAge() {
		// TODO Auto-generated method stub
		List<VacatePeople> list = vacatePeopleDao.findAll();
		for (int i = 0; i < list.size(); i++) {
			VacatePeople v = list.get(i);
			int age = 1000;
			try {
				age = com.common.utils.StringUtils.getAgeFromIdCard(v.getIdcard());
			} catch (Exception e) {
			}
			System.out.println(age);
			vacatePeopleDao.update(v);
		}
	}

	public List<HouseBasic> getListBySection(HttpServletRequest request,ModelMap model,String section,int currentpage,int pagecount){
		List<HouseBasic> list = houseBasicDao.findList(request,model,section,currentpage,pagecount);
//		initVacatePeople();
//		initHouseBasicInfo();
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
	
	private void initHouseBasicInfo(){
		List<HouseBasic> list = houseBasicDao.findAll();
		for (int i = 0; i < list.size(); i++) {
			HouseBasic h = list.get(i);
			VacatePeople baseV = vacatePeopleDao.getByParam1(h);
			if(baseV == null){
				System.err.println(i);
				continue;
			}
			h.setSex(baseV.getSex());
			h.setAge(baseV.getAge());
			houseBasicDao.update(h);
		}
	}
	
	private void initVacatePeople(){
		List<VacatePeople> list = new ArrayList<VacatePeople>();
		list = vacatePeopleDao.findAll();
		for (int i = 0; i < list.size(); i++) {
			try {
				VacatePeople v = list.get(i);
				
				VacatePeople baseV = vacatePeopleDao.getByParam(v);
				if(baseV == null){
					System.err.println(i);
					continue;
				}
				HouseBasic h = houseBasicDao.getByIdCard(baseV.getIdcard());
				v.setHousebasicid(h.getId());
				vacatePeopleDao.update(v);
			} catch (Exception e) {
				// TODO: handle exception
			}
		
		}
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
	public Integer getCount(HttpServletRequest request,String section) {
		// TODO Auto-generated method stub
		return houseBasicDao.getCount(request,section);
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
		DisplayBean display = null;
		List<DisplayBean> list = houseBasicDao.getDisplayBeanList(" and a.id = '"+housebasicid+"' ","",0,2);
		if(null != list && list.size()>0){
			display = list.get(0);
			//腾云人列表
			List<VacatePeople> vacatelist = vacatePeopleDao.findList(housebasicid,"0");
			//非在册人员列表
			List<VacatePeople> list0 = vacatePeopleDao.findList(housebasicid,"1");
			//大病
			List<OtherInfo> illList = otherInfoDao.findList(housebasicid,"2");
			//低保
			List<OtherInfo> basicLivingList = otherInfoDao.findList(housebasicid,"0");
			//残疾
			List<OtherInfo> deformityList = otherInfoDao.findList(housebasicid,"1");
			
			List<OtherInfo> otherList = otherInfoDao.findList(housebasicid, "0,1,2");
			if(null != otherList){
				display.setOtherList(otherList);
			}
			if(null != illList){
				display.setIllList(illList);
			}
			if(null != list0){
				display.setList(list0);
				display.setNotlocalpeoplecount(list0.size());
			}
			if(null != vacatelist){
				display.setVacatelist(vacatelist);
				display.setLocalpeoplecount(vacatelist.size());
			}
			if(null !=basicLivingList){
				display.setBasicLivingList(basicLivingList);
			}
			if(null != deformityList){
				display.setDeformityList(deformityList);
			}
			return display;
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
		houseBasic.setJfDate(DateUtil.DateToString(new Date(),DateStyle.YYYY_MM_DD_HH_MM_SS));
		houseBasicDao.update(houseBasic);
	}
	
	public List<Integer> getListGroupBySection(String type,String dateStr){
		return houseBasicDao.getListGroupBySection(type,dateStr);
	}
	
	public Integer getSumHasOthers(String type,String dateStr){
		return houseBasicDao.getSumHasOthers(type,dateStr);
	}
	
	public List getSumHouseInfo(String type,String dateStr){
		return houseBasicDao.getSumHouseInfo(type,dateStr);
	}
	public int getCountBySectionindex(String sectionindex, String section) {
		// TODO Auto-generated method stub
		return houseBasicDao.getCountBySectionindex(sectionindex,section);
	}
	
	
	public List<AgreenmentSectionBean> getAgSessionBeanList(String sql) {
		return houseBasicDao.getAgSessionBeanList(sql);
	}
	
	public List<Map<String,String>> getBCKZJMapList(String sql) {
		return houseBasicDao.getBCKZJMapList(sql);
	}
	
	public List<AgreenmentSectionBean> getHasOthersBeanList(String sql) {
		return houseBasicDao.getHasOthersBeanList(sql);
	}
	
	public void updateBaseInfo(HouseBasic housebasic) {
		HouseBasic h = houseBasicDao.getById(housebasic.getId());
		h.setNames(housebasic.getNames());
		h.setIdcard(housebasic.getIdcard());
		h.setLocation(housebasic.getLocation());
		h.setTelephone(housebasic.getTelephone());
		h.setMobile(housebasic.getMobile());
		h.setZjdarea(housebasic.getZjdarea());
		h.setFwarea(housebasic.getFwarea());
		h.setFirstfloorarea(housebasic.getFirstfloorarea());
		h.setAbovetwoarea(housebasic.getAbovetwoarea());
		h.setBasement(housebasic.getBasement());
		h.setShed(housebasic.getShed());
		h.setAzrkxx(housebasic.getAzrkxx());
		h.setOperatearea(housebasic.getOperatearea());
		houseBasicDao.update(h);
	}
	
	public List<Map<String,Integer>> getListByCheckResult(String subSql){
		return houseBasicDao.getListByCheckResult(subSql);
	}
	public boolean unSign(String housebasicid, String agreenmentid) {
		// TODO Auto-generated method stub
		//这种处理方式  1 将agreenment中的 Pro号清理掉 2 将indexnum中的housebasicid变更 3 解除锁定
		
		Agreement agreenment  = agreenmentDao.getById(agreenmentid);
		HouseBasic housebasic = houseBasicDao.getById(housebasicid);
		IndexNum indexNum = indexNumDao.getByBasicId(housebasicid);
		try {
			agreenment.setProtocolnumber(null);
			agreenmentDao.update(agreenment);
			
			housebasic.setIslock("0");
			houseBasicDao.update(housebasic);
			indexNum.setHousebasicid(housebasicid+"&"+RandomUtils.nextInt(100000));
			indexNumDao.update(indexNum);
		} catch (Exception e) {
			return false;
		}
		
		return true;
	}
	
	//数据导出
	
	public void export(String viewName,String fileName,OutputStream output,String sql){
		try {
			ExportExcel exportExcel = new ExportExcel<DisplayBean>();
			List<String> fieldList = houseBasicDao.getFieldFromView(viewName);
			List<Map<String,String>> dataList = houseBasicDao.getDataFromView(viewName,sql);
			Object[] arr= fieldList.toArray();
			exportExcel.exportMapExcel(fileName, fieldList, dataList, output, "yyyy-MM-dd");
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	public List<Map<String, String>> getSumKuan() {
		return houseBasicDao.getSumKuan();
	}
    
}
