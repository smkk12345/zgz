package com.hibernate.ventilate.domain;

import java.io.Serializable;
import java.util.Date;
/**
 * 降温通风
 * @author lxb
 */
public class VentModeBean implements Serializable {
	
	//通风模式
	private String ventType;
	//保水通风
	private String waterRetention;
	//保水通风系数
	private String waterRetentionFactor;
	//目标粮温
	private Double targetTem;
	//温差
	private Double temDiffer;
	//进气与出气的温差
	private Double airInOutTemDiffer;
	//进气与出气的水分差
	private Double airInOutWetDiffer;
	//空气相对湿度
	private Double airRelativeHum;
	//风速
	private Double windSpeed;
	
	private String id;
	//自动通风 0未开始 1开始
	private String autoMode;
	//通风开始条件判别  0未开始 1 开始
	private String startVentDistinguish;
	//创建时间
	private Date createTime;
	//全局参数   0 是全局  1 非全局
	private String globalPar;
	
	public String getGlobalPar() {
		return globalPar;
	}
	public void setGlobalPar(String globalPar) {
		this.globalPar = globalPar;
	}
	public String getVentType() {
		return ventType;
	}
	public void setVentType(String ventType) {
		this.ventType = ventType;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAutoMode() {
		return autoMode;
	}
	public void setAutoMode(String autoMode) {
		this.autoMode = autoMode;
	}
	public String getStartVentDistinguish() {
		return startVentDistinguish;
	}
	public void setStartVentDistinguish(String startVentDistinguish) {
		this.startVentDistinguish = startVentDistinguish;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getWaterRetention() {
		return waterRetention;
	}
	public void setWaterRetention(String waterRetention) {
		this.waterRetention = waterRetention;
	}
	public String getWaterRetentionFactor() {
		return waterRetentionFactor;
	}
	public void setWaterRetentionFactor(String waterRetentionFactor) {
		this.waterRetentionFactor = waterRetentionFactor;
	}
	public Double getTargetTem() {
		return targetTem;
	}
	public void setTargetTem(Double targetTem) {
		this.targetTem = targetTem;
	}
	public Double getTemDiffer() {
		return temDiffer;
	}
	public void setTemDiffer(Double temDiffer) {
		this.temDiffer = temDiffer;
	}
	public Double getAirInOutTemDiffer() {
		return airInOutTemDiffer;
	}
	public void setAirInOutTemDiffer(Double airInOutTemDiffer) {
		this.airInOutTemDiffer = airInOutTemDiffer;
	}
	public Double getAirInOutWetDiffer() {
		return airInOutWetDiffer;
	}
	public void setAirInOutWetDiffer(Double airInOutWetDiffer) {
		this.airInOutWetDiffer = airInOutWetDiffer;
	}
	public Double getAirRelativeHum() {
		return airRelativeHum;
	}
	public void setAirRelativeHum(Double airRelativeHum) {
		this.airRelativeHum = airRelativeHum;
	}
	public Double getWindSpeed() {
		return windSpeed;
	}
	public void setWindSpeed(Double windSpeed) {
		this.windSpeed = windSpeed;
	}
	
	public VentModeInstanceBean cloneInstance(){
		VentModeInstanceBean result = new VentModeInstanceBean();
		result.setAirInOutTemDiffer(this.getAirInOutTemDiffer());
		result.setAirInOutWetDiffer(this.getAirInOutWetDiffer());
		result.setAirRelativeHum(this.getAirRelativeHum());
		
		result.setAutoMode(this.getAutoMode());
		result.setAirInOutTemDiffer(this.getAirInOutTemDiffer());
		result.setStartVentDistinguish(this.getStartVentDistinguish());
		result.setTargetTem(this.getTargetTem());
		result.setTemDiffer(this.getTemDiffer());
		result.setVentType(this.getVentType());
		result.setWaterRetention(this.getWaterRetention());
		result.setWaterRetentionFactor(this.getWaterRetentionFactor());
		result.setWindSpeed(this.getWindSpeed());
		return result;
	}
	
}
