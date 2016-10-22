package com.hibernate.cloudInfo.domain;

import java.io.Serializable;
import java.util.Date;

public class CloudAojianDateBean implements Serializable {

	/**
	 * 
	 */
	public CloudAojianDateBean() {
	}

	private String id;
	private String zyAoJianGrainNum;
	private String aoJianDataId;
	private Date lqTime;
	private Date creatTime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getZyAoJianGrainNum() {
		return zyAoJianGrainNum;
	}

	public void setZyAoJianGrainNum(String zyAoJianGrainNum) {
		this.zyAoJianGrainNum = zyAoJianGrainNum;
	}

	public String getAoJianDataId() {
		return aoJianDataId;
	}

	public void setAoJianDataId(String aoJianDataId) {
		this.aoJianDataId = aoJianDataId;
	}

	public Date getCreatTime() {
		return creatTime;
	}

	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}

	public Date getLqTime() {
		return lqTime;
	}

	public void setLqTime(Date lqTime) {
		this.lqTime = lqTime;
	}

}
