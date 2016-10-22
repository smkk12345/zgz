package com.hibernate.sernsorInfo.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

import com.hibernate.userInfo.damain.User;

public class AlarmDataInfoBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public AlarmDataInfoBean() {}
	
	private String id;
	//告警厫间
	private String zyAoJianNum;
	//告警显示名称
	private String displayAlarmInfo;
	//告警信息-------(2,2,1)点温度异常
	private String alarmInfo;
	//告警时间--监测时间
	private Date alarmTime;
	//状态   是否确认过
	private String status;
	//库管员
	private String userId;
	//displayName
	private String displayNames;
	
	//告警级别
	private String alarmLevel;
	//坐标
	private String orderIndex;
	//告警类型  粮情  通风
	private String alarmInfoType;
	//二级告警类型
	private String secondAlarmType;
	//三级分类
	private String thirdAlarmType;
	//aoJiandataid
	private String aoJianDataId;
	
	public String getAoJianDataId() {
		return aoJianDataId;
	}
	public void setAoJianDataId(String aoJianDataId) {
		this.aoJianDataId = aoJianDataId;
	}
	public String getAlarmLevel() {
		return alarmLevel;
	}
	public void setAlarmLevel(String alarmLevel) {
		this.alarmLevel = alarmLevel;
	}
	public String getOrderIndex() {
		return orderIndex;
	}
	public void setOrderIndex(String orderIndex) {
		this.orderIndex = orderIndex;
	}
	public String getThirdAlarmType() {
		return thirdAlarmType;
	}
	public void setThirdAlarmType(String thirdAlarmType) {
		this.thirdAlarmType = thirdAlarmType;
	}
	public String getDisplayNames() {
		return displayNames;
	}
	public void setDisplayNames(String displayNames) {
		this.displayNames = displayNames;
	}
	public String getSecondAlarmType() {
		return secondAlarmType;
	}
	public void setSecondAlarmType(String secondAlarmType) {
		this.secondAlarmType = secondAlarmType;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public String getDisplayAlarmInfo() {
		return displayAlarmInfo;
	}
	public void setDisplayAlarmInfo(String displayAlarmInfo) {
		this.displayAlarmInfo = displayAlarmInfo;
	}
	public String getAlarmInfoType() {
		return alarmInfoType;
	}
	public void setAlarmInfoType(String alarmInfoType) {
		this.alarmInfoType = alarmInfoType;
	}
	public String getAlarmInfo() {
		return alarmInfo;
	}
	public void setAlarmInfo(String alarmInfo) {
		this.alarmInfo = alarmInfo;
	}
	public Date getAlarmTime() {
		return alarmTime;
	}
	public void setAlarmTime(Date alarmTime) {
		this.alarmTime = alarmTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public AlarmDataInfoBean clone(){
		AlarmDataInfoBean result = new AlarmDataInfoBean();
		result.setAlarmInfo(this.getAlarmInfo());
		result.setAlarmInfoType(this.getAlarmInfoType());
		result.setAlarmLevel(this.getAlarmLevel());
		result.setAlarmTime(this.getAlarmTime());
		
		result.setAoJianDataId(this.getAoJianDataId());
		result.setDisplayAlarmInfo(this.getDisplayAlarmInfo());
		result.setDisplayNames(this.getDisplayNames());
		result.setSecondAlarmType(this.getSecondAlarmType());
		result.setStatus(this.getStatus());
		result.setThirdAlarmType(this.getThirdAlarmType());
		result.setUserId(this.getUserId());
		result.setZyAoJianNum(this.getZyAoJianNum());
		return result;
	}
	
}
