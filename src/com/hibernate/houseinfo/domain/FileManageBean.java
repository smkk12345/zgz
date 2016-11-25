package com.hibernate.houseinfo.domain;

import com.hibernate.base.BaseBean;

public class FileManageBean extends BaseBean {

	
	//文件名称
	private String filename;
	//文件后缀名
	private String suffix;
	//文件路径
	private String path;
	//文件大小
	private String size;
	//户主id
	private String housebasicid;
	//删除状态
	private String isdel;//0未删除  1 已经删除
	
	public String getFilename() {
		return filename;
	}
	public String getSuffix() {
		return suffix;
	}
	public String getPath() {
		return path;
	}
	public String getSize() {
		return size;
	}
	public String getHousebasicid() {
		return housebasicid;
	}
	public String getIsdel() {
		return isdel;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public void setHousebasicid(String housebasicid) {
		this.housebasicid = housebasicid;
	}
	public void setIsdel(String isdel) {
		this.isdel = isdel;
	}
	
}
