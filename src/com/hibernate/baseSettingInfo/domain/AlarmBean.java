package com.hibernate.baseSettingInfo.domain;

import java.util.Date;

//告警信息
public class AlarmBean  implements java.io.Serializable,Cloneable{

	public AlarmBean(){};
	
	private String id;
	//低温，准低温，常温，湿度，水分
	private String alarmType;
	//低温，准低温，常温，湿度，水分  拼音
	private String alarmPYType;
	//平均  	
	private double averageAttri;
	//最高
	private double maxAttri;
	//默认平均值
	private double defauleAvgAttri;
	//默认最高值
	private double defaultMaxAttri;
	//高于平均
	private double gtAverageAttri;
	//水平
	private double horAttri;
	//垂直
	private double verAttri;
	//水平梯度
	private double hortGradAttri;
	
	//垂直梯度
	private double verGradAttri;
	//单点与周边极差过大
	private double pointRangeAttri;
	private String grainBeanId;
	
	private Date createDate;
	//地域
	private String area;
	//地域划分方式
	private String dyhfType;
	
	public String getDyhfType() {
		return dyhfType;
	}
	public void setDyhfType(String dyhfType) {
		this.dyhfType = dyhfType;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getGrainBeanId() {
		return grainBeanId;
	}
	public void setGrainBeanId(String grainBeanId) {
		this.grainBeanId = grainBeanId;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public double getPointRangeAttri() {
		return pointRangeAttri;
	}
	public void setPointRangeAttri(double pointRangeAttri) {
		this.pointRangeAttri = pointRangeAttri;
	}

	//粮食品种id
	public double getHortGradAttri() {
		return hortGradAttri;
	}
	public void setHortGradAttri(double hortGradAttri) {
		this.hortGradAttri = hortGradAttri;
	}
	public double getVerGradAttri() {
		return verGradAttri;
	}
	public void setVerGradAttri(double verGradAttri) {
		this.verGradAttri = verGradAttri;
	}


	//是否可被修改  canEdit  canNotEdit
	private String canEdit;
	
	public String getId() {
		return id;
	}
	public String getAlarmType() {
		return alarmType;
	}
	public void setAlarmType(String alarmType) {
		this.alarmType = alarmType;
	}
	public void setId(String id) {
		this.id = id;
	}

	public double getAverageAttri() {
		return averageAttri;
	}
	public void setAverageAttri(double averageAttri) {
		this.averageAttri = averageAttri;
	}
	public double getMaxAttri() {
		return maxAttri;
	}
	public void setMaxAttri(double maxAttri) {
		this.maxAttri = maxAttri;
	}
	public double getGtAverageAttri() {
		return gtAverageAttri;
	}
	public void setGtAverageAttri(double gtAverageAttri) {
		this.gtAverageAttri = gtAverageAttri;
	}
	public double getHorAttri() {
		return horAttri;
	}
	public void setHorAttri(double horAttri) {
		this.horAttri = horAttri;
	}
	public double getVerAttri() {
		return verAttri;
	}
	public void setVerAttri(double verAttri) {
		this.verAttri = verAttri;
	}
	public String getAlarmPYType() {
		return alarmPYType;
	}
	public void setAlarmPYType(String alarmPYType) {
		this.alarmPYType = alarmPYType;
	}
	public double getDefauleAvgAttri() {
		return defauleAvgAttri;
	}
	public void setDefauleAvgAttri(double defauleAvgAttri) {
		this.defauleAvgAttri = defauleAvgAttri;
	}
	public double getDefaultMaxAttri() {
		return defaultMaxAttri;
	}
	public void setDefaultMaxAttri(double defaultMaxAttri) {
		this.defaultMaxAttri = defaultMaxAttri;
	}
	public String getCanEdit() {
		return canEdit;
	}
	public void setCanEdit(String canEdit) {
		this.canEdit = canEdit;
	}
	
	public AlarmBean clone(){
		AlarmBean result = new AlarmBean();
		result.setAlarmPYType(this.getAlarmPYType());
		result.setAlarmType(this.getAlarmType());
		result.setArea(this.getArea());
		result.setAverageAttri(this.getAverageAttri());
		result.setCanEdit(this.getCanEdit());
		result.setDefauleAvgAttri(this.getDefauleAvgAttri());
		result.setDefaultMaxAttri(this.getDefaultMaxAttri());
		result.setGrainBeanId(this.getGrainBeanId());
		result.setGtAverageAttri(this.getGtAverageAttri());
		result.setHorAttri(this.getHorAttri());
		result.setHortGradAttri(this.getHortGradAttri());
		result.setMaxAttri(this.getMaxAttri());
		result.setPointRangeAttri(this.getPointRangeAttri());
		result.setVerAttri(this.getVerAttri());
		result.setVerGradAttri(this.getVerGradAttri());
		return result;
	}
}