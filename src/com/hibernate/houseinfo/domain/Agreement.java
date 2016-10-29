package com.hibernate.houseinfo.domain;

import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.math.BigDecimal;

import com.hibernate.base.BaseBean;

public class Agreement extends BaseBean {

	/**
	 * 协议实体类
	 */
	private String housebasicid;
	//协议编号
	private String agreementnum;
	//协议类型 0 退钱  1 分房退钱
	private String atype;
	//腾退人
	private String vacatepeople;
	//实测用地面积
	private BigDecimal scydmj;
	//宅基地年限
	private String homesteadyear;
	//宅基地控制面积
	private BigDecimal conhomestarea;
	//over  超出宅基地
	private BigDecimal overhomesteadarea;
	//大棚
	private BigDecimal shed;

	//市场估价
//	private BigDecimal scgj;
	
	//房屋补偿面积
	private BigDecimal fwbcmj;
	//认定被安置人口
	private Integer rdbazrk;
	//认定被安置人口信息
	private Integer rdbazrkxx;
	//选房房源信息
	private String fyxx;
	//实际选房面积
	private BigDecimal sjxfmj;
	//分房情况
	//一居室几套
	private Integer yjs;
	//两居室
	private Integer ljs;
	//三居室
	private Integer sjs;
	//安置房购房款
	private BigDecimal azfgfk;
	//宅基地腾退总价 包括宅基地腾退补偿款，被重置房屋重置成新价，奖励费，补助费
	private BigDecimal zjdttzj;
	//评估机构
	private String pgjg;
	//宅基地腾退补偿款
	private BigDecimal zjdttbck;
	//控制宅基地区位补偿价
	private BigDecimal kzzjdqwbcj;
	//超控宅基地区位补偿价
	private BigDecimal ckzjdqwbcj;
	//被腾退房屋重置成新价
	private BigDecimal bttfwczcxj;
	//奖励费，补助费合计
	private BigDecimal jlbzhj;
	//提前搬家奖
	private BigDecimal tqbjl;
	//工程配合奖励
	private BigDecimal gcphjl;
	//腾退促进奖励
	private BigDecimal ttcjjl;
	//无违章奖励费
	private BigDecimal wwzjl;
	//未建二层及地下室奖励费
	private BigDecimal wjecjj;
	// 补助费合计
	private BigDecimal bzfhj;
	//--------------------------------补助费--------------
	//搬家及家电迁移补助费
	private BigDecimal bjbz;
	//期房补助费
	private BigDecimal qfbz;
	//大病补助
	private BigDecimal dbbz;
	//残疾补助
	private BigDecimal cjbz;
	//低保户补助
	private BigDecimal dbhbz;
	//独生子女补助
	private BigDecimal dsznbz;
	//停产停业补助
	private BigDecimal tctdbz;
	//其他
	private BigDecimal otherbz;
	//奖励费合计
	private BigDecimal jlfsum;
	
	//腾退截至日期
	private String ttrq;
	
	
	public String getHousebasicid() {
		return housebasicid;
	}


	public void setHousebasicid(String housebasicid) {
		this.housebasicid = housebasicid;
	}


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


	public BigDecimal getScydmj() {
		return scydmj;
	}


	public void setScydmj(BigDecimal scydmj) {
		this.scydmj = scydmj;
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


	public BigDecimal getFwbcmj() {
		return fwbcmj;
	}


	public void setFwbcmj(BigDecimal fwbcmj) {
		this.fwbcmj = fwbcmj;
	}


	public Integer getRdbazrk() {
		return rdbazrk;
	}


	public void setRdbazrk(Integer rdbazrk) {
		this.rdbazrk = rdbazrk;
	}


	public Integer getRdbazrkxx() {
		return rdbazrkxx;
	}


	public void setRdbazrkxx(Integer rdbazrkxx) {
		this.rdbazrkxx = rdbazrkxx;
	}


	public String getFyxx() {
		return fyxx;
	}


	public void setFyxx(String fyxx) {
		this.fyxx = fyxx;
	}


	public BigDecimal getSjxfmj() {
		return sjxfmj;
	}


	public void setSjxfmj(BigDecimal sjxfmj) {
		this.sjxfmj = sjxfmj;
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


	public BigDecimal getAzfgfk() {
		return azfgfk;
	}


	public void setAzfgfk(BigDecimal azfgfk) {
		this.azfgfk = azfgfk;
	}


	public BigDecimal getZjdttzj() {
		return zjdttzj;
	}


	public void setZjdttzj(BigDecimal zjdttzj) {
		this.zjdttzj = zjdttzj;
	}


	public String getPgjg() {
		return pgjg;
	}


	public void setPgjg(String pgjg) {
		this.pgjg = pgjg;
	}


	public BigDecimal getZjdttbck() {
		return zjdttbck;
	}


	public void setZjdttbck(BigDecimal zjdttbck) {
		this.zjdttbck = zjdttbck;
	}


	public BigDecimal getKzzjdqwbcj() {
		return kzzjdqwbcj;
	}


	public void setKzzjdqwbcj(BigDecimal kzzjdqwbcj) {
		this.kzzjdqwbcj = kzzjdqwbcj;
	}


	public BigDecimal getCkzjdqwbcj() {
		return ckzjdqwbcj;
	}


	public void setCkzjdqwbcj(BigDecimal ckzjdqwbcj) {
		this.ckzjdqwbcj = ckzjdqwbcj;
	}


	public BigDecimal getBttfwczcxj() {
		return bttfwczcxj;
	}


	public void setBttfwczcxj(BigDecimal bttfwczcxj) {
		this.bttfwczcxj = bttfwczcxj;
	}


	public BigDecimal getJlbzhj() {
		return jlbzhj;
	}


	public void setJlbzhj(BigDecimal jlbzhj) {
		this.jlbzhj = jlbzhj;
	}


	public BigDecimal getTqbjl() {
		return tqbjl;
	}


	public void setTqbjl(BigDecimal tqbjl) {
		this.tqbjl = tqbjl;
	}


	public BigDecimal getGcphjl() {
		return gcphjl;
	}


	public void setGcphjl(BigDecimal gcphjl) {
		this.gcphjl = gcphjl;
	}


	public BigDecimal getTtcjjl() {
		return ttcjjl;
	}


	public void setTtcjjl(BigDecimal ttcjjl) {
		this.ttcjjl = ttcjjl;
	}


	public BigDecimal getWwzjl() {
		return wwzjl;
	}


	public void setWwzjl(BigDecimal wwzjl) {
		this.wwzjl = wwzjl;
	}


	public BigDecimal getWjecjj() {
		return wjecjj;
	}


	public void setWjecjj(BigDecimal wjecjj) {
		this.wjecjj = wjecjj;
	}


	public BigDecimal getBzfhj() {
		return bzfhj;
	}


	public void setBzfhj(BigDecimal bzfhj) {
		this.bzfhj = bzfhj;
	}


	public BigDecimal getBjbz() {
		return bjbz;
	}


	public void setBjbz(BigDecimal bjbz) {
		this.bjbz = bjbz;
	}


	public BigDecimal getQfbz() {
		return qfbz;
	}


	public void setQfbz(BigDecimal qfbz) {
		this.qfbz = qfbz;
	}


	public BigDecimal getDbbz() {
		return dbbz;
	}


	public void setDbbz(BigDecimal dbbz) {
		this.dbbz = dbbz;
	}


	public BigDecimal getCjbz() {
		return cjbz;
	}


	public void setCjbz(BigDecimal cjbz) {
		this.cjbz = cjbz;
	}


	public BigDecimal getDbhbz() {
		return dbhbz;
	}


	public void setDbhbz(BigDecimal dbhbz) {
		this.dbhbz = dbhbz;
	}


	public BigDecimal getDsznbz() {
		return dsznbz;
	}


	public void setDsznbz(BigDecimal dsznbz) {
		this.dsznbz = dsznbz;
	}


	public BigDecimal getTctdbz() {
		return tctdbz;
	}


	public void setTctdbz(BigDecimal tctdbz) {
		this.tctdbz = tctdbz;
	}


	public BigDecimal getOtherbz() {
		return otherbz;
	}


	public void setOtherbz(BigDecimal otherbz) {
		this.otherbz = otherbz;
	}


	public BigDecimal getJlfsum() {
		return jlfsum;
	}


	public void setJlfsum(BigDecimal jlfsum) {
		this.jlfsum = jlfsum;
	}


	public String getTtrq() {
		return ttrq;
	}


	public void setTtrq(String ttrq) {
		this.ttrq = ttrq;
	}


	public static void main(String[] args) {
		PropertyDescriptor[] props = null;
		StringBuffer sb = new StringBuffer();
		try {
			props = Introspector.getBeanInfo(new Agreement().getClass(),
					Object.class).getPropertyDescriptors();
		} catch (IntrospectionException e) {
		}
		if (props != null) {
			for (int i = 0; i < props.length; i++) {
				try {
					String aa = props[i].getName();// 获取bean中的属性  <property name="dpbz" ></property>

					sb.append("<property name=\"").append(aa).append("\" ></property>\n");
					System.out.println(aa);
					//Object object = props[i].getPropertyType();// 获取属性的类型
				} catch (Exception e) {
					
				}
			}
		}
		System.out.println(sb.toString());
	}
}
