package com.hibernate.ventilate.domain;

import java.io.Serializable;
import java.util.Date;
/**
 * 通风实例 bean
 * @author lxb
 */
public class VentModeInstanceBean implements Serializable {
	
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
	//结束时间
	private Date finshTime;
	//aoJianId
	private String aoJianId;
	//状态 ---start---stop---pause  ---
	private String status;
	//通风时长---persistent period
	private double pspd;
	
	public Date getFinshTime() {
		return finshTime;
	}
	public void setFinshTime(Date finshTime) {
		this.finshTime = finshTime;
	}
	public String getAoJianId() {
		return aoJianId;
	}
	public void setAoJianId(String aoJianId) {
		this.aoJianId = aoJianId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public double getPspd() {
		return pspd;
	}
	public void setPspd(double pspd) {
		this.pspd = pspd;
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
	
}
