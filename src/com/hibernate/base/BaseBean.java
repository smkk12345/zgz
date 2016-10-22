package com.hibernate.base;

import java.io.Serializable;
import java.util.Date;

public class BaseBean implements Serializable {

	//
	private static final long serialVersionUID = 1442709734390999469L;
	
	private String id;
	//创建时间
	private Date createTime;

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	//更新时间
	private Date updateTime;

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
