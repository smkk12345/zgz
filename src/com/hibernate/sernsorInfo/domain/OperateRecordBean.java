package com.hibernate.sernsorInfo.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

import com.hibernate.userInfo.damain.User;

public class OperateRecordBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4710364766304285048L;
	
	public OperateRecordBean() {}
	
	private String id;
	//操作类型
	private String operateType;
	//操作内容
	private String operateInfo;
	//操作人
	private String operateUserId;
	//操作时间
	private Date operateTime;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOperateType() {
		return operateType;
	}
	public void setOperateType(String operateType) {
		this.operateType = operateType;
	}
	public String getOperateInfo() {
		return operateInfo;
	}
	public void setOperateInfo(String operateInfo) {
		this.operateInfo = operateInfo;
	}
	public String getOperateUserId() {
		return operateUserId;
	}
	public void setOperateUserId(String operateUserId) {
		this.operateUserId = operateUserId;
	}
	public Date getOperateTime() {
		return operateTime;
	}
	public void setOperateTime(Date operateTime) {
		this.operateTime = operateTime;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
