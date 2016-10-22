package com.hibernate.barnInfo.domain;

import java.util.Date;
import java.util.Set;

import com.common.utils.CalendarUtil;
import com.hibernate.baseSettingInfo.domain.AlarmBean;
import com.hibernate.sernsorInfo.domain.SensorArrangementBean;
import com.hibernate.userInfo.damain.User;

public class AoJianGrainInfoBean {
	
	public AoJianGrainInfoBean(){};
	
	private String id;
	//廒间编号
	private String zyAoJianNum;
	//粮食种类
	private String grainType;
	//粮食编码
	private String grainCode;
	//入库时间
	private Date inputTime;
	//出库时间
	private Date outTime;
	//生产地
	private String grainOrigin;
	//收获时间
	private Date harvestTime;
	//级别
	private String level;
	//水分
	private String storageMoisture;
	//杂质
	private String impurity;
	//不完整粒
	private String unsoundGrain;
	//容量
	private Double capacity;
	//单位容量重
	private Double unitWeight;
	//备注
	private String remarks;
	
	//存储模式
	private String storeType;
	
	private Double length;
	private Double width;
	private Double height;
	/*这三个字段页面显示用*/
	private String inputTimeStr;
	private String outTimeStr;
	private String harvestTimeStr;
	
	public Double getLength() {
		return length;
	}
	public void setLength(Double length) {
		this.length = length;
	}
	public Double getWidth() {
		return width;
	}
	public void setWidth(Double width) {
		this.width = width;
	}
	public Double getHeight() {
		return height;
	}
	public void setHeight(Double height) {
		this.height = height;
	}
	public String getInputTimeStr() {
		if(null!=inputTime){
			return CalendarUtil.formatStr(inputTime, CalendarUtil.DATE_FORMAT_MODE1);
		}
		else{
			return "";
		}
	}
	public void setInputTimeStr(String inputTimeStr) {
		this.inputTimeStr = inputTimeStr;
	}
	public String getOutTimeStr() {
		if(null!=outTime){
			return CalendarUtil.formatStr(outTime, CalendarUtil.DATE_FORMAT_MODE1);
		}
		else{
			return "";
		}
	}
	public void setOutTimeStr(String outTimeStr) {
		this.outTimeStr = outTimeStr;
	}
	public String getHarvestTimeStr() {
		if(null!=harvestTime){
			return CalendarUtil.formatStr(harvestTime, CalendarUtil.DATE_FORMAT_MODE1);
		}
		else{
			return "";
		}
	}
	public void setHarvestTimeStr(String harvestTimeStr) {
		this.harvestTimeStr = harvestTimeStr;
	}
	public String getStoreType() {
		return storeType;
	}
	public void setStoreType(String storeType) {
		this.storeType = storeType;
	}

	//状态 当前粮食状态 0 已经出库 1当前存储胡粮食
	private String curGrainInfo;
	
	public String getCurGrainInfo() {
		return curGrainInfo;
	}
	public void setCurGrainInfo(String curGrainInfo) {
		this.curGrainInfo = curGrainInfo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getZyAoJianNum() {
		return zyAoJianNum;
	}
	public void setZyAoJianNum(String zyAoJianNum) {
		this.zyAoJianNum = zyAoJianNum;
	}
	public String getGrainType() {
		return grainType;
	}
	public void setGrainType(String grainType) {
		this.grainType = grainType;
	}
	public String getGrainCode() {
		return grainCode;
	}
	public void setGrainCode(String grainCode) {
		this.grainCode = grainCode;
	}
	public Date getInputTime() {
		return inputTime;
	}
	public void setInputTime(Date inputTime) {
		this.inputTime = inputTime;
	}
	public Date getOutTime() {
		return outTime;
	}
	public void setOutTime(Date outTime) {
		this.outTime = outTime;
	}
	public String getGrainOrigin() {
		return grainOrigin;
	}
	public void setGrainOrigin(String grainOrigin) {
		this.grainOrigin = grainOrigin;
	}
	public Date getHarvestTime() {
		return harvestTime;
	}
	public void setHarvestTime(Date harvestTime) {
		this.harvestTime = harvestTime;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getStorageMoisture() {
		return storageMoisture;
	}
	public void setStorageMoisture(String storageMoisture) {
		this.storageMoisture = storageMoisture;
	}
	public String getImpurity() {
		return impurity;
	}
	public void setImpurity(String impurity) {
		this.impurity = impurity;
	}
	public String getUnsoundGrain() {
		return unsoundGrain;
	}
	public void setUnsoundGrain(String unsoundGrain) {
		this.unsoundGrain = unsoundGrain;
	}
	public Double getCapacity() {
		return capacity;
	}
	public void setCapacity(Double capacity) {
		this.capacity = capacity;
	}
	public Double getUnitWeight() {
		return unitWeight;
	}
	public void setUnitWeight(Double unitWeight) {
		this.unitWeight = unitWeight;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}


}
