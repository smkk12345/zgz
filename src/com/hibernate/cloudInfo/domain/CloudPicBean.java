package com.hibernate.cloudInfo.domain;

import java.io.Serializable;
import java.util.Date;


public class CloudPicBean implements Serializable {

	/**
	 * 
	 */
	public CloudPicBean() {}
	private String id;
	private String aoJianDataId;
	private Integer yuTuType;
	private String section;
	private Integer ViewOrder;
	private String picUrl;
	private Date creatTime;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAoJianDataId() {
		return aoJianDataId;
	}
	public void setAoJianDataId(String aoJianDataId) {
		this.aoJianDataId = aoJianDataId;
	}
	public Integer getYuTuType() {
		return yuTuType;
	}
	public void setYuTuType(Integer yuTuType) {
		this.yuTuType = yuTuType;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public Integer getViewOrder() {
		return ViewOrder;
	}
	public void setViewOrder(Integer viewOrder) {
		ViewOrder = viewOrder;
	}
	public String getPicUrl() {
		return picUrl;
	}
	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}
	public Date getCreatTime() {
		return creatTime;
	}
	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}
	
	
}
