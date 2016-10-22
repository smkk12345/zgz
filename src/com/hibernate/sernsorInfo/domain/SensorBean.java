package com.hibernate.sernsorInfo.domain;

import com.hibernate.base.BaseBean;

public class SensorBean extends BaseBean implements java.io.Serializable {

	public SensorBean() {}

	private String id;
	
	private String sensorName;
	
	private String sensorType;
	
	private String serialNum;
	
	private String sensorFactory;
	//指定路径下的配置文件url
	private String formatUrl;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSensorName() {
		return sensorName;
	}
	public void setSensorName(String sensorName) {
		this.sensorName = sensorName;
	}
	public String getSensorType() {
		return sensorType;
	}
	public void setSensorType(String sensorType) {
		this.sensorType = sensorType;
	}
	public String getSerialNum() {
		return serialNum;
	}
	public void setSerialNum(String serialNum) {
		this.serialNum = serialNum;
	}
	public String getSensorFactory() {
		return sensorFactory;
	}
	public void setSensorFactory(String sensorFactory) {
		this.sensorFactory = sensorFactory;
	}
	public String getFormatUrl() {
		return formatUrl;
	}
	public void setFormatUrl(String formatUrl) {
		this.formatUrl = formatUrl;
	}
}
