package com.hibernate.houseinfo.domain;

import com.hibernate.base.BaseBean;
/**
 * 其他信息
 * @author yulei
 *
 */
public class OtherInfo extends BaseBean {
	
	//
	private String housebasicid;
	//姓名
	private String name;
	private String otype;// 0 低保  1 残疾  2 大兵
	//户籍序号
	private String peopleid;
	//证书号  是低保  就是低保证号  残疾就是残疾证号
	private String certificatenum;
	//残疾证 审核有效期
	private String validatedate;
	//25种大病
	private String illnessname;
	//大病证明
	private String illnessprove;
	
	public String getHousebasicid() {
		return housebasicid;
	}
	public void setHousebasicid(String housebasicid) {
		this.housebasicid = housebasicid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOtype() {
		return otype;
	}
	public void setOtype(String otype) {
		this.otype = otype;
	}
	public String getPeopleid() {
		return peopleid;
	}
	public void setPeopleid(String peopleid) {
		this.peopleid = peopleid;
	}
	public String getCertificatenum() {
		return certificatenum;
	}
	public void setCertificatenum(String certificatenum) {
		this.certificatenum = certificatenum;
	}
	public String getValidatedate() {
		return validatedate;
	}
	public void setValidatedate(String validatedate) {
		this.validatedate = validatedate;
	}
	public String getIllnessname() {
		return illnessname;
	}
	public void setIllnessname(String illnessname) {
		this.illnessname = illnessname;
	}
	public String getIllnessprove() {
		return illnessprove;
	}
	public void setIllnessprove(String illnessprove) {
		this.illnessprove = illnessprove;
	}
	
}
