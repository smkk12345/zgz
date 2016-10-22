package com.hibernate.sernsorInfo.domain;

import java.io.Serializable;

public class ArrangementDataBean implements Serializable {
	
	private String  id;
	//布置信息
	private SensorArrangementBean sensorArrangementBean;
	//位置信息(x,y,z)
	private String position;
	
	private String isDelete;//0 已经删除   1未删除s
	//缆线编号
	private String cableIndex;
	//真实位置信息x
	private Double posX;
	//真实位置y
	private Double posY;
	//真实位置z
	private Double posZ;
	//探头号
	private int probeNum;
	//廒间id
	private String zyAoJianId;
	

	public int getProbeNum() {
		return probeNum;
	}
	public String getZyAoJianId() {
		return zyAoJianId;
	}
	public void setZyAoJianId(String zyAoJianId) {
		this.zyAoJianId = zyAoJianId;
	}
	public void setProbeNum(int probeNum) {
		this.probeNum = probeNum;
	}
	public Double getPosX() {
		return posX;
	}
	public void setPosX(Double posX) {
		this.posX = posX;
	}
	public Double getPosY() {
		return posY;
	}
	public void setPosY(Double posY) {
		this.posY = posY;
	}
	public Double getPosZ() {
		return posZ;
	}
	public void setPosZ(Double posZ) {
		this.posZ = posZ;
	}
	public String getCableIndex() {
		return cableIndex;
	}
	public void setCableIndex(String cableIndex) {
		this.cableIndex = cableIndex;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public SensorArrangementBean getSensorArrangementBean() {
		return sensorArrangementBean;
	}
	public void setSensorArrangementBean(SensorArrangementBean sensorArrangementBean) {
		this.sensorArrangementBean = sensorArrangementBean;
	}

	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
}
