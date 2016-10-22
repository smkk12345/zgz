package com.hibernate.ventilate.domain;

import java.io.Serializable;

public class WindowDeviceBean extends BaseDevice implements Serializable {

	//窗口
	private static final long serialVersionUID = 6211479808472187749L;
	//设备厂家
	private String deviceFactory;
	//设备厂家编号
	private String deviceNum;
	//面位置----正面、反面
	private String facePos;
	//具体位置信息
	private String pos;
	
	public String getDeviceFactory() {
		return deviceFactory;
	}
	public void setDeviceFactory(String deviceFactory) {
		this.deviceFactory = deviceFactory;
	}
	public String getDeviceNum() {
		return deviceNum;
	}
	public void setDeviceNum(String deviceNum) {
		this.deviceNum = deviceNum;
	}
	public String getFacePos() {
		return facePos;
	}
	public void setFacePos(String facePos) {
		this.facePos = facePos;
	}
	public String getPos() {
		return pos;
	}
	public void setPos(String pos) {
		this.pos = pos;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
