package com.hibernate.ventilate.domain;

import java.util.Date;
/**
 * 设备 基类 一个子类一张表
 * @author zhiyun3
 */
public class BaseDevice {
	private String id;
	//设备编号
	private String deviceNo;
	//设备名称
	private String deviceName;
	//控制器厂家
	private String factoryName;
	//控制器厂家编号
	private String factoryNum;
	//控制器编号
	private String controllerNum;
	//创建时间
	private Date createTime;
	//廒间编号
	private String aoJianId;
	//pos信息
	private String posInfo;
	//状态 打开或者关闭
	private Boolean isOpen = false;
	
	public Boolean getIsOpen() {
		return isOpen;
	}
	public void setIsOpen(Boolean isOpen) {
		this.isOpen = isOpen;
	}
	public String getPosInfo() {
		return posInfo;
	}

	public void setPosInfo(String posInfo) {
		this.posInfo = posInfo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getDeviceNo() {
		return deviceNo;
	}
	public void setDeviceNo(String deviceNo) {
		this.deviceNo = deviceNo;
	}
	public String getDeviceName() {
		return deviceName;
	}
	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}
	public String getFactoryName() {
		return factoryName;
	}
	public void setFactoryName(String factoryName) {
		this.factoryName = factoryName;
	}
	public String getFactoryNum() {
		return factoryNum;
	}
	public void setFactoryNum(String factoryNum) {
		this.factoryNum = factoryNum;
	}
	public String getControllerNum() {
		return controllerNum;
	}
	public void setControllerNum(String controllerNum) {
		this.controllerNum = controllerNum;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getAoJianId() {
		return aoJianId;
	}

	public void setAoJianId(String aoJianId) {
		this.aoJianId = aoJianId;
	}
}
