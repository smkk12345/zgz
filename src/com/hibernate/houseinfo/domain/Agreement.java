package com.hibernate.houseinfo.domain;

import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.math.BigDecimal;

import com.common.utils.StringUtils;
import com.hibernate.base.BaseBean;
import com.hibernate.utils.MoneyUtils;

public class Agreement extends BaseBean {

	
	//协议号
	private String protocolnumber;


	/**
	 * 协议实体类sad a
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
	private String rdbazrkxx;
	//选房房源信息
	private String fyxx;
	//实际选房面积
	private BigDecimal sjxfmj;
	//分房情况
	//一居室几套
	private Integer yjs;
	//两居室
	private Integer ljs70;
	//两居室
	private Integer ljs75;
	//两居室
	private Integer ljs80;
	//两居室
	private Integer ljs85;
	//三居室
	private Integer sjs;

	//安置房购房款
	private BigDecimal azfgfk;
	private String dxazfgfk;
	//宅基地腾退总价 包括宅基地腾退补偿款，被重置房屋重置成新价，奖励费，补助费
	private BigDecimal zjdttzj;
	private String dxzjdttzj;
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
	//未经批准已建二层补助
	private BigDecimal wjpzyjecbz;
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
	//周转补助费
	private BigDecimal zzbz;
	//其他
	private BigDecimal otherbz;
	//奖励费合计
	private BigDecimal jlfsum;
	
	//腾退截至日期
	private String ttrq;
	//装修设备附属物
	private BigDecimal zxsbfsw;
	//指标内面积
	private BigDecimal zbnmj;
	//超指标面积
	private BigDecimal czbmj;
	//房屋家夼
	private BigDecimal fwjk;
	//指标内购房款
	private BigDecimal zbngfk;
	//指标外购房狂
	private BigDecimal zbwgfk;
	
	//计算字段
	//实际选房套数
	private Integer xfts;
	//选房面积
	private BigDecimal xfarea;
	//总补偿款-选房款
	private BigDecimal jshk;
	private String dxjshk;
	//实建面
	private BigDecimal sjm;
	
	//数据导入用到的字段
	private String names;  //户主名称
	//房屋坐落
	private String location;
	//组别编号
	private String sectionindex;
	
	//数据补录
	
	//父母以及超生子女姓名
	private String parentnames;
	//认定住房空难
	private String hardhouse;
	//被腾退家庭购房标准
    private String gfbz50;
    private String gfbz45;
    
    //认定宅基地总补偿面积
    private String rdzjdallarea;
    
  //住房困难户补偿方案
    private String zfknhbcfa;
    
    //控制面积区位补偿单价
    private BigDecimal kzmjqwbcdj;
    
    //超控制面积区位补偿单价
    private BigDecimal ckmjqwbcdj;
    
  //补偿宅基地面积
    private BigDecimal bczjdmj;
    
  //补偿宅基地面积
    private BigDecimal yxmj;
    
  //装修设备附属物价款
    private BigDecimal zxsbfswjk;
    
    
  //滴水补助费:
    private BigDecimal dsbzf;
    
  //信鸽补助费
    private BigDecimal xgbzf;
    
  //宅基地应批未批补助
    private BigDecimal zjdypwpbz;
  //优惠指标未选满补偿
    private BigDecimal yhzbwxmbc;
    
    private String sfcs;//是否超生
    
    private String kzkxmj;
    
    
	public String getKzkxmj() {
		return kzkxmj;
	}


	public void setKzkxmj(String kzkxmj) {
		this.kzkxmj = kzkxmj;
	}


	private String rdzfkn;
	
	//是否满足不足200平米补助200平米:
    private String bzbzmj="1";
	
	
	
	public String getParentnames() {
		return parentnames;
	}


	public String getHardhouse() {
		return hardhouse;
	}


	public void setParentnames(String parentnames) {
		this.parentnames = parentnames;
	}


	public void setHardhouse(String hardhouse) {
		this.hardhouse = hardhouse;
	}
	
	public String getSectionindex() {
		return sectionindex;
	}


	public void setSectionindex(String sectionindex) {
		this.sectionindex = sectionindex;
	}


	public String getNames() {
		return names;
	}


	public String getLocation() {
		return location;
	}


	public void setNames(String names) {
		this.names = names;
	}


	public void setLocation(String location) {
		this.location = location;
	}


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


	public String getRdbazrkxx() {
		return rdbazrkxx;
	}


	public void setRdbazrkxx(String rdbazrkxx) {
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
		if(null != azfgfk){
			dxazfgfk = MoneyUtils.change(azfgfk.doubleValue());
		}
	}


	public BigDecimal getZjdttzj() {
		return zjdttzj;
	}


	public void setZjdttzj(BigDecimal zjdttzj) {
		this.zjdttzj = zjdttzj;
		if(null != zjdttzj){
			dxzjdttzj = MoneyUtils.change(zjdttzj.doubleValue());
		}
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

	public String getProtocolnumber() {
		return protocolnumber;
	}


	public void setProtocolnumber(String protocolnumber) {
		this.protocolnumber = protocolnumber;
	}

	public static void main(String[] args) {
		PropertyDescriptor[] props = null;
		StringBuffer sb = new StringBuffer();
		try {
			props = Introspector.getBeanInfo(new DisplayBean().getClass(),
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


	public Integer getLjs70() {
		return ljs70;
	}


	public void setLjs70(Integer ljs70) {
		this.ljs70 = ljs70;
	}


	public Integer getLjs75() {
		return ljs75;
	}


	public void setLjs75(Integer ljs75) {
		this.ljs75 = ljs75;
	}


	public Integer getLjs80() {
		return ljs80;
	}


	public void setLjs80(Integer ljs80) {
		this.ljs80 = ljs80;
	}


	public Integer getLjs85() {
		return ljs85;
	}


	public void setLjs85(Integer ljs85) {
		this.ljs85 = ljs85;
	}


	public String getDxzjdttzj() {
		return dxzjdttzj;
	}


	public void setDxzjdttzj(String dxzjdttzj) {
		this.dxzjdttzj = dxzjdttzj;
	}


	public String getDxazfgfk() {
		return dxazfgfk;
	}


	public void setDxazfgfk(String dxazfgfk) {
		this.dxazfgfk = dxazfgfk;
	}



	public BigDecimal getJshk() {
		return jshk;
		
	}


	public BigDecimal getSjm() {
		return new BigDecimal(13132);
	}


	public void setXfts(Integer xfts) {
		this.xfts = xfts;
	}


	public void setXfarea(BigDecimal xfarea) {
		this.xfarea = xfarea;
	}


	public void setJshk(BigDecimal jshk) {
		this.jshk = jshk;
		if(null != jshk){
			dxjshk = MoneyUtils.change(Math.abs(jshk.doubleValue()));
		}
	}


	public void setSjm(BigDecimal sjm) {
		this.sjm = sjm;
	}


	public BigDecimal getZxsbfsw() {
		return zxsbfsw;
	}


	public BigDecimal getZbnmj() {
		return zbnmj;
	}


	public BigDecimal getCzbmj() {
		return czbmj;
	}


	public void setZxsbfsw(BigDecimal zxsbfsw) {
		this.zxsbfsw = zxsbfsw;
	}


	public void setZbnmj(BigDecimal zbnmj) {
		this.zbnmj = zbnmj;
	}


	public void setCzbmj(BigDecimal czbmj) {
		this.czbmj = czbmj;
	}


	public BigDecimal getFwjk() {
		return fwjk;
	}


	public BigDecimal getZbngfk() {
		return zbngfk;
	}


	public BigDecimal getZbwgfk() {
		return zbwgfk;
	}


	public void setFwjk(BigDecimal fwjk) {
		this.fwjk = fwjk;
	}


	public void setZbngfk(BigDecimal zbngfk) {
		this.zbngfk = zbngfk;
	}


	public void setZbwgfk(BigDecimal zbwgfk) {
		this.zbwgfk = zbwgfk;
	}


	public String getGfbz50() {
		return gfbz50;
	}


	public void setGfbz50(String gfbz50) {
		this.gfbz50 = gfbz50;
	}


	public String getGfbz45() {
		return gfbz45;
	}


	public void setGfbz45(String gfbz45) {
		this.gfbz45 = gfbz45;
	}


	public String getRdzjdallarea() {
		return rdzjdallarea;
	}


	public void setRdzjdallarea(String rdzjdallarea) {
		this.rdzjdallarea = rdzjdallarea;
	}


	public String getZfknhbcfa() {
		return zfknhbcfa;
	}


	public void setZfknhbcfa(String zfknhbcfa) {
		this.zfknhbcfa = zfknhbcfa;
	}


	public String getRdzfkn() {
		return rdzfkn;
	}


	public void setRdzfkn(String rdzfkn) {
		this.rdzfkn = rdzfkn;
	}


	public BigDecimal getWjpzyjecbz() {
		return wjpzyjecbz;
	}


	public BigDecimal getZzbz() {
		return zzbz;
	}


	public void setZzbz(BigDecimal zzbz) {
		this.zzbz = zzbz;
	}


	public void setWjpzyjecbz(BigDecimal wjpzyjecbz) {
		this.wjpzyjecbz = wjpzyjecbz;
	}


	public String getDxjshk() {
		return dxjshk;
	}


	public void setDxjshk(String dxjshk) {
		this.dxjshk = dxjshk;
	}


	public Integer getXfts() {
		return xfts;
	}


	public BigDecimal getXfarea() {
		return xfarea;
	}


	public BigDecimal getKzmjqwbcdj() {
		return kzmjqwbcdj;
	}


	public void setKzmjqwbcdj(BigDecimal kzmjqwbcdj) {
		this.kzmjqwbcdj = kzmjqwbcdj;
	}


	public BigDecimal getCkmjqwbcdj() {
		return ckmjqwbcdj;
	}


	public void setCkmjqwbcdj(BigDecimal ckmjqwbcdj) {
		this.ckmjqwbcdj = ckmjqwbcdj;
	}


	public BigDecimal getBczjdmj() {
		return bczjdmj;
	}


	public void setBczjdmj(BigDecimal bczjdmj) {
		this.bczjdmj = bczjdmj;
	}


	public BigDecimal getYxmj() {
		return yxmj;
	}


	public void setYxmj(BigDecimal yxmj) {
		this.yxmj = yxmj;
	}


	public BigDecimal getZxsbfswjk() {
		return zxsbfswjk;
	}


	public void setZxsbfswjk(BigDecimal zxsbfswjk) {
		this.zxsbfswjk = zxsbfswjk;
	}


	public BigDecimal getDsbzf() {
		return dsbzf;
	}


	public void setDsbzf(BigDecimal dsbzf) {
		this.dsbzf = dsbzf;
	}


	public BigDecimal getXgbzf() {
		return xgbzf;
	}


	public void setXgbzf(BigDecimal xgbzf) {
		this.xgbzf = xgbzf;
	}


	public BigDecimal getZjdypwpbz() {
		return zjdypwpbz;
	}


	public void setZjdypwpbz(BigDecimal zjdypwpbz) {
		this.zjdypwpbz = zjdypwpbz;
	}


	public BigDecimal getYhzbwxmbc() {
		return yhzbwxmbc;
	}


	public void setYhzbwxmbc(BigDecimal yhzbwxmbc) {
		this.yhzbwxmbc = yhzbwxmbc;
	}


	public String getBzbzmj() {
		return bzbzmj;
	}


	public void setBzbzmj(String bzbzmj) {
		this.bzbzmj = bzbzmj;
	}


	public String getSfcs() {
		return sfcs;
	}


	public void setSfcs(String sfcs) {
		this.sfcs = sfcs;
	}


	
}
