package com.hibernate.ventilate.domain;

import java.io.Serializable;

public class FanDeviceBean extends BaseDevice implements Serializable {
	/**
	 * 风机
	 */
	private static final long serialVersionUID = 4374772159582559760L;
	//设备厂家
	private String deviceFactory;
	//设备厂家编号
	private String deviceNum;
	//风向-----单向、双向
	private String windDir;
	//型号
	private String model;
	//功率
	private String power;
	//频率模式-----定频，变频
	private String frequenceyType;
	//通风口
	private VentDeviceBean ventDevice;

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
	public String getWindDir() {
		return windDir;
	}
	public void setWindDir(String windDir) {
		this.windDir = windDir;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getPower() {
		return power;
	}
	public void setPower(String power) {
		this.power = power;
	}
	public String getFrequenceyType() {
		return frequenceyType;
	}
	public void setFrequenceyType(String frequenceyType) {
		this.frequenceyType = frequenceyType;
	}
	public VentDeviceBean getVentDevice() {
		return ventDevice;
	}
	public void setVentDevice(VentDeviceBean ventDevice) {
		this.ventDevice = ventDevice;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
