package com.hibernate.barnInfo.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.codehaus.jackson.impl.Indenter;

import com.common.utils.StringUtils;
import com.hibernate.userInfo.damain.User;
import com.spring.ServiceManager;


public class BarnBean implements Serializable {

	public BarnBean() {}
	private String id;
	
	private String aoJianCount;
	private Set<AoJianBean> aoJianSet;
	private String barnIndex;
	private Double length;
	private Double width;
	private Double height;
	private Double capacity;
	//绝对坐标
	private Double xPos;
	private Double yPos;
	//角度
	private Double angle;
	//删除状态
	private String isDel;//0,1已经删除

	//创建时间
	private Date createTime;
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
	public Double getAngle() {
		return angle;
	}
	public void setAngle(Double angle) {
		this.angle = angle;
	}
	public Set<AoJianBean> getAoJianSet() {
		return aoJianSet;
	}
	public void setAoJianSet(Set<AoJianBean> aoJianSet) {
		this.aoJianSet = aoJianSet;
	}
	public String getAoJianCount() {
		return aoJianCount;
	}
	public void setAoJianCount(String aoJianCount) {
		this.aoJianCount = aoJianCount;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getBarnIndex() {
		return barnIndex;
	}
	public void setBarnIndex(String barnIndex) {
		this.barnIndex = barnIndex;
	}
	public Double getLength() {
		return length;
	}
	public void setLength(Double length) {
		this.length = length;
	}
	public Double getWidth() {
		return width;
	}
	public void setWidth(Double width) {
		this.width = width;
	}
	public Double getHeight() {
		return height;
	}
	public void setHeight(Double height) {
		this.height = height;
	}
	public Double getCapacity() {
		return capacity;
	}
	public void setCapacity(Double capacity) {
		this.capacity = capacity;
	}
//	public LqtUser getAdministrator() {
//		return administrator;
//	}
//	public void setAdministrator(LqtUser administrator) {
//		this.administrator = administrator;
//	}
	public Double getxPos() {
		return xPos;
	}
	public void setxPos(Double xPos) {
		this.xPos = xPos;
	}
	public Double getyPos() {
		return yPos;
	}
	public void setyPos(Double yPos) {
		this.yPos = yPos;
	}
}
