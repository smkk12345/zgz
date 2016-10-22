package com.hibernate.sernsorInfo.domain;

import java.io.Serializable;

public class SensorDataBean implements Serializable {

	public SensorDataBean() {
	}

	private String id;

	// 传感器位于编号 x，y，z
	private String sensorIndex;
	// 温度
	private double temperature;
	// 湿度
	private double humidity;
	// 水分
	private double wet;
	// 露点
	private double dewPoint;
	// 廒间数据信息
	private String aoJianDataId;

	// 排序字段
	private Integer orderIndex;
	//0---没有 1--有
	private String noData;
	//缆线编号
	private String cableIndex;
	//探头号
	private Integer probeNum;
	
	public Integer getProbeNum() {
		return probeNum;
	}

	public void setProbeNum(Integer probeNum) {
		this.probeNum = probeNum;
	}

	public String getCableIndex() {
		return cableIndex;
	}

	public void setCableIndex(String cableIndex) {
		this.cableIndex = cableIndex;
	}

	public String getNoData() {
		return noData;
	}

	public void setNoData(String noData) {
		this.noData = noData;
	}

	public String getAoJianDataId() {
		return aoJianDataId;
	}

	public void setAoJianDataId(String aoJianDataId) {
		this.aoJianDataId = aoJianDataId;
	}

	public Integer getOrderIndex() {
		return orderIndex;
	}

	public void setOrderIndex(Integer orderIndex) {
		this.orderIndex = orderIndex;
	}

	public double getWet() {
		return wet;
	}

	public void setWet(double wet) {
		this.wet = wet;
	}

	public double getDewPoint() {
		return dewPoint;
	}

	public void setDewPoint(double dewPoint) {
		this.dewPoint = dewPoint;
	}

	public String getSensorIndex() {
		return sensorIndex;
	}

	public void setSensorIndex(String sensorIndex) {
		this.sensorIndex = sensorIndex;
	}

	public double getTemperature() {
		return temperature;
	}

	public void setTemperature(double temperature) {
		this.temperature = temperature;
	}

	public double getHumidity() {
		return humidity;
	}

	public void setHumidity(double humidity) {
		this.humidity = humidity;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setDataBeanId(String id) {
		this.id = id;

	}
}
