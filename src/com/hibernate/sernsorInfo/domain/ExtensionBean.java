package com.hibernate.sernsorInfo.domain;

import java.io.Serializable;

import com.hibernate.barnInfo.domain.AoJianBean;

public class ExtensionBean implements Serializable {
	/**
	 * 分机编号和廒间对应bean
	 */
	public ExtensionBean() {}
	private String id;
	//分机编号
	private String serialNum;
	//仓房  廒间
	private AoJianBean aoJian;
	
	//传感器布置
	private SensorArrangementBean arrangementBean;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSerialNum() {
		return serialNum;
	}
	public void setSerialNum(String serialNum) {
		this.serialNum = serialNum;
	}
	public AoJianBean getAoJian() {
		return aoJian;
	}
	public void setAoJian(AoJianBean aoJian) {
		this.aoJian = aoJian;
	}
	public SensorArrangementBean getArrangementBean() {
		return arrangementBean;
	}
	public void setArrangementBean(SensorArrangementBean arrangementBean) {
		this.arrangementBean = arrangementBean;
	}
}
