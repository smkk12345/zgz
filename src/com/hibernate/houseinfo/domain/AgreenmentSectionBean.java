package com.hibernate.houseinfo.domain;

public class AgreenmentSectionBean {
	
	private String id;
	
	private String section;
	
	private String curdate;
	private String qystatus;//0 未签约  1 已经签约  a  dsa das d
	private Integer qycount;
	private String qytype; //0 安置 1 货币sss
	
	public String getId() {
		return id;
	}
	public String getSection() {
		return section;
	}
	public String getCurdate() {
		return curdate;
	}
	public String getQystatus() {
		return qystatus;
	}
	public Integer getQycount() {
		return qycount;
	}
	public String getQytype() {
		return qytype;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public void setCurdate(String curdate) {
		this.curdate = curdate;
	}
	public void setQystatus(String qystatus) {
		this.qystatus = qystatus;
	}
	public void setQycount(Integer qycount) {
		this.qycount = qycount;
	}
	public void setQytype(String qytype) {
		this.qytype = qytype;
	}
	
}
