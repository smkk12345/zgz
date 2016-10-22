package com.hibernate.sernsorInfo.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

public class AoJianDataBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public AoJianDataBean() {}
	
	private String id;
	
	private String zyAoJianGrainNum;
	
	public String getZyAoJianGrainNum() {
		return zyAoJianGrainNum;
	}
	public void setZyAoJianGrainNum(String zyAoJianGrainNum) {
		this.zyAoJianGrainNum = zyAoJianGrainNum;
	}

	//检测时间
	private java.util.Date startDate;
	//仓温
	private double aoJianTem;
	//仓湿
	private double aoJianhumidity;
	//外温
	private double outerTem;
	//外湿
	private double outerHumidity;

	//粮温监测点个数
	private int sensorCount;
	//均 温值
	private double jwz;
	//均温安全状态
	private boolean jwaqzt;
	//温度均匀度方差值
	private double wdjyfcz;
	//均湿值
	private double jsz;
	//均湿度安全状态
	private boolean jsdaqzt;
	//湿度安全房差值
	private double sdjjfcz;
	//均水分
	private double jsf;
	//均水分安全状态
	private boolean jsfaqzt;
	//水分均匀度方差值
	private double sfjyfcz;

	//点信息
	private String pointAlarmInfo;
	//面
	private String faceAlarmInfo;
	//风道1温度
	private String fd1Tem;
	//风道1湿度
	private String fd1Hum;
	//风道2温度
	private String fd2Tem;
	//风道2湿度
	private String fd2Hum;
	
	//是否被编辑过
	private Boolean isEdited = false;
	
	public Boolean getIsEdited() {
		return isEdited;
	}
	public void setIsEdited(Boolean isEdited) {
		this.isEdited = isEdited;
	}
	public String getFd1Tem() {
		return fd1Tem;
	}
	public void setFd1Tem(String fd1Tem) {
		this.fd1Tem = fd1Tem;
	}
	public String getFd1Hum() {
		return fd1Hum;
	}
	public void setFd1Hum(String fd1Hum) {
		this.fd1Hum = fd1Hum;
	}
	public String getFd2Tem() {
		return fd2Tem;
	}
	public void setFd2Tem(String fd2Tem) {
		this.fd2Tem = fd2Tem;
	}
	public String getFd2Hum() {
		return fd2Hum;
	}
	public void setFd2Hum(String fd2Hum) {
		this.fd2Hum = fd2Hum;
	}
	public String getFaceAlarmInfo() {
		return faceAlarmInfo;
	}
	public void setFaceAlarmInfo(String faceAlarmInfo) {
		this.faceAlarmInfo = faceAlarmInfo;
	}
	public String getPointAlarmInfo() {
		return pointAlarmInfo;
	}
	public void setPointAlarmInfo(String pointAlarmInfo) {
		this.pointAlarmInfo = pointAlarmInfo;
	}

	//告警点信息    字符串   (sensorDataId:tem:)
	private String alarmInfo;
	
	public double getJwz() {
		return jwz;
	}
	public void setJwz(double jwz) {
		this.jwz = jwz;
	}
	public boolean isJwaqzt() {
		return jwaqzt;
	}
	public void setJwaqzt(boolean jwaqzt) {
		this.jwaqzt = jwaqzt;
	}
	public double getWdjyfcz() {
		return wdjyfcz;
	}
	public void setWdjyfcz(double wdjyfcz) {
		this.wdjyfcz = wdjyfcz;
	}
	public double getJsz() {
		return jsz;
	}
	public void setJsz(double jsz) {
		this.jsz = jsz;
	}
	public boolean isJsdaqzt() {
		return jsdaqzt;
	}
	public void setJsdaqzt(boolean jsdaqzt) {
		this.jsdaqzt = jsdaqzt;
	}
	public double getSdjjfcz() {
		return sdjjfcz;
	}
	public void setSdjjfcz(double sdjjfcz) {
		this.sdjjfcz = sdjjfcz;
	}
	public double getJsf() {
		return jsf;
	}
	public void setJsf(double jsf) {
		this.jsf = jsf;
	}
	public boolean isJsfaqzt() {
		return jsfaqzt;
	}
	public void setJsfaqzt(boolean jsfaqzt) {
		this.jsfaqzt = jsfaqzt;
	}
	public double getSfjyfcz() {
		return sfjyfcz;
	}
	public void setSfjyfcz(double sfjyfcz) {
		this.sfjyfcz = sfjyfcz;
	}
	public String getAlarmInfo() {
		return alarmInfo;
	}
	public void setAlarmInfo(String alarmInfo) {
		this.alarmInfo = alarmInfo;
	}

	public double getAoJianTem() {
		return aoJianTem;
	}
	public void setAoJianTem(double aoJianTem) {
		this.aoJianTem = aoJianTem;
	}
	public double getAoJianhumidity() {
		return aoJianhumidity;
	}
	public void setAoJianhumidity(double aoJianhumidity) {
		this.aoJianhumidity = aoJianhumidity;
	}
	public int getSensorCount() {
		return sensorCount;
	}
	public void setSensorCount(int sensorCount) {
		this.sensorCount = sensorCount;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public java.util.Date getStartDate() {
		return startDate;
	}
	public void setStartDate(java.util.Date startDate) {
		this.startDate = startDate;
	}
	public double getOuterTem() {
		return outerTem;
	}
	public void setOuterTem(double outerTem) {
		this.outerTem = outerTem;
	}
	public double getOuterHumidity() {
		return outerHumidity;
	}
	public void setOuterHumidity(double outerHumidity) {
		this.outerHumidity = outerHumidity;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
