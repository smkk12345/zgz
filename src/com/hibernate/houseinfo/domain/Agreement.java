package com.hibernate.houseinfo.domain;

import java.math.BigDecimal;

import com.hibernate.base.BaseBean;

public class Agreement extends BaseBean {

	/**
	 * 协议实体类
	 */
	//协议编号
	private String agreementnum;
	//协议类型 0 退钱  1 分房退钱
	private String atype;
	//腾退人
	private String vacatepeople;
	//宅基地年限
	private String homesteadyear;
	//宅基地控制面积
	private BigDecimal conhomestarea;
	//over  超出宅基地
	private BigDecimal overhomesteadarea;
	//大棚
	private BigDecimal shed;
	//评估机构
	private String pgjg;
	//市场估价
	private BigDecimal scgj;
	//腾退各项补助费
	//宅基地未分户补助
	private BigDecimal wfhbz;
	//停产停业补助
	private BigDecimal tctdbz;
	//搬家及家电迁移补助费
	private BigDecimal bgbz;
	//期房补助费
	private BigDecimal qfbz;
	//大病补助费
	private BigDecimal dpbz;
	//残疾补助费
	private BigDecimal cjbz;
	//低保补助费
	private BigDecimal dbbz;
	//独生子女补助费
	private BigDecimal dsznbz;
	//独生子女证个数
	private Integer dsznz;
	//腾退合计费用
	private BigDecimal vacatesum;
	//------------------------腾退各项奖励费--------------------------------
	
	//分房情况
	//一居室几套
	private Integer yjs;
	//两居室
	private Integer ljs;
	//三居室
	private Integer sjs;
	
	//未建奖励费
	private BigDecimal wjjlf;
	//无违章奖励费
	private BigDecimal wwzjlf;
	//提前搬家奖励费
	private BigDecimal tqbjjlf;
	//工程配合奖励费
	private BigDecimal gcphjlf;
	//预签约20天奖励费
	private BigDecimal qyjlf;
	//其他
	private BigDecimal other;
	//奖励费合计
	private BigDecimal jlfsum;
	//总合计
	private BigDecimal sum;
	
	public String getAgreementnum() {
		return agreementnum;
	}
	public void setAgreementnum(String agreementnum) {
		this.agreementnum = agreementnum;
	}
	public String getAtype() {
		return atype;
	}
	public void setAtype(String atype) {
		this.atype = atype;
	}
	public String getVacatepeople() {
		return vacatepeople;
	}
	public void setVacatepeople(String vacatepeople) {
		this.vacatepeople = vacatepeople;
	}
	public String getHomesteadyear() {
		return homesteadyear;
	}
	public void setHomesteadyear(String homesteadyear) {
		this.homesteadyear = homesteadyear;
	}
	public BigDecimal getConhomestarea() {
		return conhomestarea;
	}
	public void setConhomestarea(BigDecimal conhomestarea) {
		this.conhomestarea = conhomestarea;
	}
	public BigDecimal getOverhomesteadarea() {
		return overhomesteadarea;
	}
	public void setOverhomesteadarea(BigDecimal overhomesteadarea) {
		this.overhomesteadarea = overhomesteadarea;
	}
	public BigDecimal getShed() {
		return shed;
	}
	public void setShed(BigDecimal shed) {
		this.shed = shed;
	}
	public String getPgjg() {
		return pgjg;
	}
	public void setPgjg(String pgjg) {
		this.pgjg = pgjg;
	}
	public BigDecimal getScgj() {
		return scgj;
	}
	public void setScgj(BigDecimal scgj) {
		this.scgj = scgj;
	}
	public BigDecimal getWfhbz() {
		return wfhbz;
	}
	public void setWfhbz(BigDecimal wfhbz) {
		this.wfhbz = wfhbz;
	}
	public BigDecimal getTctdbz() {
		return tctdbz;
	}
	public void setTctdbz(BigDecimal tctdbz) {
		this.tctdbz = tctdbz;
	}
	public BigDecimal getBgbz() {
		return bgbz;
	}
	public void setBgbz(BigDecimal bgbz) {
		this.bgbz = bgbz;
	}
	public BigDecimal getQfbz() {
		return qfbz;
	}
	public void setQfbz(BigDecimal qfbz) {
		this.qfbz = qfbz;
	}
	public BigDecimal getDpbz() {
		return dpbz;
	}
	public void setDpbz(BigDecimal dpbz) {
		this.dpbz = dpbz;
	}
	public BigDecimal getCjbz() {
		return cjbz;
	}
	public void setCjbz(BigDecimal cjbz) {
		this.cjbz = cjbz;
	}
	public BigDecimal getDbbz() {
		return dbbz;
	}
	public void setDbbz(BigDecimal dbbz) {
		this.dbbz = dbbz;
	}
	public BigDecimal getDsznbz() {
		return dsznbz;
	}
	public void setDsznbz(BigDecimal dsznbz) {
		this.dsznbz = dsznbz;
	}
	public Integer getDsznz() {
		return dsznz;
	}
	public void setDsznz(Integer dsznz) {
		this.dsznz = dsznz;
	}
	public BigDecimal getVacatesum() {
		return vacatesum;
	}
	public void setVacatesum(BigDecimal vacatesum) {
		this.vacatesum = vacatesum;
	}
	public Integer getYjs() {
		return yjs;
	}
	public void setYjs(Integer yjs) {
		this.yjs = yjs;
	}
	public Integer getLjs() {
		return ljs;
	}
	public void setLjs(Integer ljs) {
		this.ljs = ljs;
	}
	public Integer getSjs() {
		return sjs;
	}
	public void setSjs(Integer sjs) {
		this.sjs = sjs;
	}
	public BigDecimal getWjjlf() {
		return wjjlf;
	}
	public void setWjjlf(BigDecimal wjjlf) {
		this.wjjlf = wjjlf;
	}
	public BigDecimal getWwzjlf() {
		return wwzjlf;
	}
	public void setWwzjlf(BigDecimal wwzjlf) {
		this.wwzjlf = wwzjlf;
	}
	public BigDecimal getTqbjjlf() {
		return tqbjjlf;
	}
	public void setTqbjjlf(BigDecimal tqbjjlf) {
		this.tqbjjlf = tqbjjlf;
	}
	public BigDecimal getGcphjlf() {
		return gcphjlf;
	}
	public void setGcphjlf(BigDecimal gcphjlf) {
		this.gcphjlf = gcphjlf;
	}
	public BigDecimal getQyjlf() {
		return qyjlf;
	}
	public void setQyjlf(BigDecimal qyjlf) {
		this.qyjlf = qyjlf;
	}
	public BigDecimal getOther() {
		return other;
	}
	public void setOther(BigDecimal other) {
		this.other = other;
	}
	public BigDecimal getJlfsum() {
		return jlfsum;
	}
	public void setJlfsum(BigDecimal jlfsum) {
		this.jlfsum = jlfsum;
	}
	public BigDecimal getSum() {
		return sum;
	}
	public void setSum(BigDecimal sum) {
		this.sum = sum;
	}
	
}
